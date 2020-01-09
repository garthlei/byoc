

module bp_l15_transducer
 import bp_common_pkg::*;
 import bp_common_aviary_pkg::*;
 import bp_be_pkg::*;
 import bp_be_dcache_pkg::*;
 #(parameter bp_params_e bp_params_p = e_bp_single_core_cfg
   `declare_bp_proc_params(bp_params_p)
   )
  (input clk_i
   , input reset_i

   // BP -> L1.5
   //
   // Status signals
   , output logic                                      ready_o
   //, output                                            cache_miss_o

   // Miss type
   , input                                             load_miss_i
   //, input                                             store_miss_i
   //, input                                             lr_miss_i
   //, input                                             uncached_load_req_i
   //, input                                             uncached_store_req_i
   // Miss info
   , input [39:0]                                      miss_addr_i
   , input [2:0]                                       lru_way_i
   //, input [7:0]                                       dirty_i
   //, input [63:0]                                      store_data_o
   //, input [1:0]                                       size_op_o

   // OpenPiton side
   , output logic [4:0]                                transducer_l15_rqtype
   , output logic [2:0]                                transducer_l15_size
   , output logic                                      transducer_l15_val
   , output logic [39:0]                               transducer_l15_address
   , output logic [63:0]                               transducer_l15_data
   , output logic [1:0]                                transducer_l15_l1rplway
   , input                                             l15_transducer_ack

   , input                                             l15_transducer_val
   , input [3:0]                                       l15_transducer_returntype
   , input [63:0]                                      l15_transducer_data_0
   , input [63:0]                                      l15_transducer_data_1
   , output logic                                      transducer_l15_req_ack

   // Unused OpenPiton side connections
   , input                                             l15_transducer_header_ack
   , output                                            transducer_l15_nc
   , output [3:0]                                      transducer_l15_amo_op
   , output [0:0]                                      transducer_l15_threadid
   , output                                            transducer_l15_prefetch
   , output                                            transducer_l15_invalidate_cacheline
   , output                                            transducer_l15_blockstore
   , output                                            transducer_l15_blockinitstore
   , output [63:0]                                     transducer_l15_data_next_entry
   , output [`TLB_CSM_WIDTH-1:0]                       transducer_l15_csm_data

   // L1.5 -> BP
   , output logic [522:0]                              data_mem_pkt_o
   , output logic                                      data_mem_pkt_v_o
   , input logic                                       data_mem_pkt_yumi_i

   , output logic [41:0]                               tag_mem_pkt_o
   , output logic                                      tag_mem_pkt_v_o
   , input logic                                       tag_mem_pkt_yumi_i

   , output logic [10:0]                               stat_mem_pkt_o
   , output logic                                      stat_mem_pkt_v_o
   , input logic                                       stat_mem_pkt_yumi_i
   );

  `declare_bp_be_dcache_lce_data_mem_pkt_s(lce_sets_p, lce_assoc_p, cce_block_width_p);
  `declare_bp_be_dcache_lce_tag_mem_pkt_s(lce_sets_p, lce_assoc_p, ptag_width_p);
  `declare_bp_be_dcache_lce_stat_mem_pkt_s(lce_sets_p, lce_assoc_p);

  bp_be_dcache_lce_data_mem_pkt_s data_mem_pkt;
  bp_be_dcache_lce_tag_mem_pkt_s tag_mem_pkt;
  bp_be_dcache_lce_stat_mem_pkt_s stat_mem_pkt;
  logic data_mem_pkt_yumi_r, tag_mem_pkt_yumi_r, stat_mem_pkt_yumi_r;

  localparam byte_offset_width_lp = `BSG_SAFE_CLOG2(dword_width_p >> 3);
  localparam index_width_lp       = `BSG_SAFE_CLOG2(lce_sets_p);

  enum logic [3:0]
  {
    e_reset
    ,e_ready
    ,e_load_send
    ,e_load
    ,e_load_done
    ,e_store_store
    ,e_store
    ,e_store_done
  } state_n, state_r;

  wire miss_fifo_v_li = load_miss_i;
  logic miss_fifo_ready_lo;
  logic [39:0] miss_addr_lo;
  logic [2:0] lru_way_lo;
  logic miss_v_lo, miss_yumi_li;
  bsg_one_fifo
   #(.width_p(40+3))
   miss_fifo
    (.clk_i(clk_i)
     ,.reset_i(reset_i)
     
     ,.data_i({lru_way_i, miss_addr_i})
     ,.v_i(miss_fifo_v_li)
     ,.ready_o(miss_fifo_ready_lo)

     ,.data_o({lru_way_lo, miss_addr_lo})
     ,.v_o(miss_v_lo)
     ,.yumi_i(miss_yumi_li)
     );

  logic [127:0] miss_data_li;
  logic miss_data_v_li, miss_data_ready_lo;
  logic [511:0] load_cacheline_lo;
  logic load_cacheline_v_lo, load_cacheline_yumi_li;
  bsg_serial_in_parallel_out_full
   #(.width_p(128)
     ,.els_p(4)
     ,.use_minimal_buffering_p(1)
     )
   load_piso
    (.clk_i(clk_i)
     ,.reset_i(reset_i)

     ,.data_i(miss_data_li)
     ,.v_i(miss_data_v_li)
     ,.ready_o(miss_data_ready_lo)

     ,.data_o(load_cacheline_lo)
     ,.v_o(load_cacheline_v_lo)
     ,.yumi_i(load_cacheline_yumi_li)
     );
  assign load_cacheline_yumi_li = miss_yumi_li;

  logic [`BSG_WIDTH(4)-1:0] miss_cnt;
  logic miss_up_li;
  wire miss_clr_li = miss_yumi_li;
  bsg_counter_clear_up
   #(.max_val_p(4)
     ,.init_val_p(0)
     )
   miss_counter
    (.clk_i(clk_i)
     ,.reset_i(reset_i)

     ,.clear_i(miss_clr_li)
     ,.up_i(miss_up_li)

     ,.count_o(miss_cnt)
     );
  wire miss_almost_done = (miss_cnt == 3);

  always_comb
    begin
      ready_o = 1'b0;

      transducer_l15_rqtype = '0;
      transducer_l15_size = '0;
      transducer_l15_address = '0;
      transducer_l15_data = '0;
      transducer_l15_l1rplway = '0;
      transducer_l15_val = '0;

      transducer_l15_req_ack = '0;

      miss_up_li = '0;

      miss_data_li = '0;
      miss_data_v_li = '0;

      miss_yumi_li = '0;

      data_mem_pkt_v_o = '0;
      tag_mem_pkt_v_o = '0;
      stat_mem_pkt_v_o = '0;

      unique case (state_r)
        e_reset:
          begin
            transducer_l15_req_ack = (l15_transducer_val & (l15_transducer_returntype == `INT_RET));

            state_n = transducer_l15_req_ack ? e_ready : e_reset;
          end
        e_ready:
          begin
            ready_o = miss_fifo_ready_lo;

            state_n = miss_v_lo ? e_load_send : e_ready;
          end
        e_load_send:
          begin
            transducer_l15_rqtype = `LOAD_RQ;
            transducer_l15_size = `PCX_SZ_16B;
            transducer_l15_address = miss_addr_lo + (miss_cnt << `BSG_SAFE_CLOG2(128));
            /* TODO: Increase associativity */
            transducer_l15_l1rplway = lru_way_lo[1:0];
            transducer_l15_val = 1'b1;

            state_n = l15_transducer_ack ? e_load : e_load_send;
          end
        e_load:
          begin
            transducer_l15_req_ack = (l15_transducer_val & (l15_transducer_returntype == `LOAD_RET));

            miss_up_li = transducer_l15_req_ack;

            miss_data_li = {l15_transducer_data_1, l15_transducer_data_0};
            miss_data_v_li = transducer_l15_req_ack;

            state_n = transducer_l15_req_ack 
                      ? miss_almost_done
                        ? e_load_done
                        : e_load_send
                      : e_load;
          end
        e_load_done:
          begin
            data_mem_pkt_v_o = ~data_mem_pkt_yumi_r;
            tag_mem_pkt_v_o = ~tag_mem_pkt_yumi_r;
            stat_mem_pkt_v_o = ~stat_mem_pkt_yumi_r;

            miss_yumi_li = data_mem_pkt_yumi_r & tag_mem_pkt_yumi_r & stat_mem_pkt_yumi_r;
          end
        default: begin end
      endcase
    end

  always_ff @(posedge clk_i)
    if (reset_i)
      state_r <= e_reset;
    else
      state_r <= state_n;

  always_ff @(posedge clk_i)
    if (reset_i || miss_yumi_li)
      begin
        data_mem_pkt_yumi_r <= 1'b0;
        tag_mem_pkt_yumi_r <= 1'b0;
        stat_mem_pkt_yumi_r <= 1'b0;
      end
    else
      begin
        data_mem_pkt_yumi_r <= data_mem_pkt_yumi_r | data_mem_pkt_yumi_i;
        tag_mem_pkt_yumi_r <= tag_mem_pkt_yumi_r | tag_mem_pkt_yumi_i;
        stat_mem_pkt_yumi_r <= stat_mem_pkt_yumi_r | stat_mem_pkt_yumi_i;
      end

  assign data_mem_pkt.index = miss_addr_lo[byte_offset_width_lp+:index_width_lp];
  assign data_mem_pkt.way_id = lru_way_lo;
  assign data_mem_pkt.data = load_cacheline_lo;
  assign data_mem_pkt.opcode = e_dcache_lce_data_mem_write;

  assign tag_mem_pkt.index = miss_addr_lo[byte_offset_width_lp+:index_width_lp];
  assign tag_mem_pkt.way_id = lru_way_lo;
  assign tag_mem_pkt.state = '0;
  assign tag_mem_pkt.tag = miss_addr_lo[paddr_width_p-1-:ptag_width_p];
  assign tag_mem_pkt.opcode = e_dcache_lce_tag_mem_set_tag;

  assign stat_mem_pkt.index = miss_addr_lo[byte_offset_width_lp+:index_width_lp];
  assign stat_mem_pkt.way_id = lru_way_lo;
  assign stat_mem_pkt.opcode = e_dcache_lce_stat_mem_set_clear;

  // BP -> L1.15
  // L1.5 -> BP
  assign data_mem_pkt_o = data_mem_pkt;
  assign tag_mem_pkt_o = tag_mem_pkt;
  assign stat_mem_pkt_o = stat_mem_pkt;

  // Unused by BlackParrot
  assign transducer_l15_nc = '0;
  assign transducer_l15_amo_op = '0;
  assign transducer_l15_threadid = '0;
  assign transducer_l15_prefetch = '0;
  assign transducer_l15_invalidate_cacheline = '0;
  assign transducer_l15_blockstore = '0;
  assign transducer_l15_blockinitstore = '0;
  assign transducer_l15_data_next_entry = '0;
  assign transducer_l15_csm_data = '0;

endmodule 
  
