

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
   , output logic                                      isync_o
   , output logic                                      dsync_o
   , output logic                                      ready_o
   // Miss info
   , input                                             miss_v_i
   , output logic                                      miss_yumi_o
   , input                                             uncached_i
   , input [39:0]                                      miss_addr_i
   , input [2:0]                                       lru_way_i
   , input                                             store_i
   , input [63:0]                                      store_data_i
   , input [1:0]                                       size_op_i

   // OpenPiton side
   , output logic [4:0]                                transducer_l15_rqtype
   , output logic                                      transducer_l15_nc
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

  localparam byte_offset_width_lp=`BSG_SAFE_CLOG2(dword_width_p>>3);
  localparam word_offset_width_lp=`BSG_SAFE_CLOG2(8);
  localparam block_offset_width_lp=(word_offset_width_lp+byte_offset_width_lp);
  localparam index_width_lp       = `BSG_SAFE_CLOG2(lce_sets_p);

  enum logic [3:0]
  {
    e_reset
    ,e_isync
    ,e_dsync
    ,e_ready
    ,e_load_send
    ,e_load
    ,e_load_done
    ,e_blockload
    ,e_blockload_done
    ,e_store_send
    ,e_store
  } state_n, state_r;

  logic [127:0] miss_data_li;
  logic miss_data_v_li, miss_data_ready_lo;
  logic [511:0] load_cacheline_lo;
  logic [63:0] load_uncached_i;
  logic load_cacheline_v_lo, load_cacheline_yumi_li;
  bsg_serial_in_parallel_out_dynamic
   #(.width_p(128)
     ,.max_els_p(4)
     )
   load_sipo
    (.clk_i(clk_i)
     ,.reset_i(reset_i)

     ,.data_i(miss_data_li)
     ,.v_i(miss_data_v_li)
     ,.len_i((uncached_i ? 2'd0 : 2'd3))
     ,.ready_o(miss_data_ready_lo)
     ,.len_ready_o()

     ,.data_o(load_cacheline_lo)
     ,.v_o(load_cacheline_v_lo)
     ,.yumi_i(load_cacheline_yumi_li)
     );
  // Dequeue whenever useful
  assign load_cacheline_yumi_li = load_cacheline_v_lo & miss_yumi_o;

  logic [`BSG_WIDTH(4)-1:0] miss_cnt;
  logic miss_up_li;
  wire miss_clr_li = miss_yumi_o;
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

  logic [39:0] inv_addr_li;
  logic [`BSG_WIDTH(63)-1:0] inv_cnt;
  logic inv_up_li;
  wire inv_clr_li = '0;
  bsg_counter_clear_up
   #(.max_val_p(63)
     ,.init_val_p(0)
     )
   inv_counter
    (.clk_i(clk_i)
     ,.reset_i(reset_i)

     ,.clear_i(inv_clr_li)
     ,.up_i(inv_up_li)

     ,.count_o(inv_cnt)
     );
  wire inv_almost_done = (inv_cnt == 63);

  always_comb
    begin
      inv_addr_li = '0;

      inv_up_li = '0;

      isync_o = '0;
      dsync_o = '0;
      ready_o = '0;

      transducer_l15_rqtype = '0;
      transducer_l15_nc = '0;
      transducer_l15_size = '0;
      transducer_l15_address = '0;
      transducer_l15_data = '0;
      transducer_l15_l1rplway = '0;
      transducer_l15_val = '0;

      transducer_l15_req_ack = '0;

      miss_up_li = '0;

      miss_data_li = '0;
      miss_data_v_li = '0;

      miss_yumi_o = '0;

      data_mem_pkt_v_o = '0;
      tag_mem_pkt_v_o = '0;
      stat_mem_pkt_v_o = '0;

      unique case (state_r)
        e_reset:
          begin
            transducer_l15_req_ack = (l15_transducer_val & (l15_transducer_returntype == `INT_RET));

            state_n = transducer_l15_req_ack ? e_isync : e_reset;
          end
        e_isync:
          begin
            isync_o = 1'b1;
            inv_addr_li = (inv_cnt << 6);

            stat_mem_pkt_v_o = 1'b1;
            tag_mem_pkt_v_o = 1'b1;

            inv_up_li = 1'b1;

            state_n = inv_almost_done ? e_dsync : e_isync;
          end
        e_dsync:
          begin
            dsync_o = 1'b1;
            inv_addr_li = (inv_cnt << 6);

            stat_mem_pkt_v_o = 1'b1;
            tag_mem_pkt_v_o = 1'b1;

            inv_up_li = 1'b1;

            state_n = inv_almost_done ? e_ready : e_dsync;
          end
        e_ready:
          begin
            ready_o = 1'b1;

            state_n = miss_v_i 
                      ? store_i
                        ? e_store_send
                        : e_load_send 
                      : e_ready;
          end
        e_load_send:
          begin
            transducer_l15_rqtype = `LOAD_RQ;
            transducer_l15_nc = uncached_i;
            transducer_l15_size = uncached_i
                                  ? (size_op_i == 2'b00)
                                    ? `PCX_SZ_1B
                                    : (size_op_i == 2'b01)
                                      ? `PCX_SZ_2B
                                      : (size_op_i == 2'b10)
                                        ? `PCX_SZ_4B
                                        : `PCX_SZ_8B
                                  : `PCX_SZ_16B;
            transducer_l15_address = miss_addr_i + (miss_cnt << `BSG_SAFE_CLOG2(128));
            /* TODO: Increase associativity */
            transducer_l15_l1rplway = lru_way_i[1:0];
            transducer_l15_val = 1'b1;

            state_n = l15_transducer_ack
                      ? uncached_i
                        ? e_load
                        : e_blockload
                      : e_load_send;
          end
        e_load:
          begin
            transducer_l15_req_ack = (l15_transducer_val & (l15_transducer_returntype == `LOAD_RET));

            miss_yumi_o = l15_transducer_val;

            miss_data_li = {l15_transducer_data_1, l15_transducer_data_0};
            miss_data_v_li = transducer_l15_req_ack;

            state_n = l15_transducer_val ? e_load_done : e_load;
          end
        e_load_done:
          begin
            data_mem_pkt_v_o = 1'b1;

            // 128 bits 1-8 bytes
            load_uncached_i = (size_op_i == 2'b00)
                                  ? (load_cacheline_lo >> (8*(miss_addr_i[3+:4])))
                                  : (size_op_i == 2'b01)
                                    ? (load_cacheline_lo >> (8*(miss_addr_i[3+:3])))
                                    : (size_op_i == 2'b10)
                                      ? (load_cacheline_lo >> (8*(miss_addr_i[3+:2])))
                                      : (load_cacheline_lo >> (8*(miss_addr_i[3+:1])));

            miss_yumi_o = data_mem_pkt_yumi_i;

            state_n = miss_yumi_o ? e_ready : e_load_done;
          end
        e_blockload:
          begin
            transducer_l15_req_ack = (l15_transducer_val & (l15_transducer_returntype == `LOAD_RET));

            miss_up_li = transducer_l15_req_ack;

            miss_data_li = {l15_transducer_data_1[0+:8] , l15_transducer_data_1[8+:8] ,
                            l15_transducer_data_1[16+:8], l15_transducer_data_1[24+:8],
                            l15_transducer_data_1[32+:8], l15_transducer_data_1[40+:8],
                            l15_transducer_data_1[48+:8], l15_transducer_data_1[56+:8],
                            l15_transducer_data_0[0+:8] , l15_transducer_data_0[8+:8] ,
                            l15_transducer_data_0[16+:8], l15_transducer_data_0[24+:8],
                            l15_transducer_data_0[32+:8], l15_transducer_data_0[40+:8],
                            l15_transducer_data_0[48+:8], l15_transducer_data_0[56+:8]};
            miss_data_v_li = transducer_l15_req_ack;

            state_n = transducer_l15_req_ack 
                      ? miss_almost_done
                        ? e_blockload_done
                        : e_load_send
                      : e_blockload;
          end
        e_blockload_done:
          begin
            data_mem_pkt_v_o = 1'b1;
            tag_mem_pkt_v_o = 1'b1;

            miss_yumi_o = data_mem_pkt_yumi_i & tag_mem_pkt_yumi_i;

            state_n = miss_yumi_o ? e_ready : e_blockload_done;
          end
        e_store_send:
          begin
            transducer_l15_rqtype = `STORE_RQ;
            transducer_l15_nc = uncached_i;
            transducer_l15_size = (size_op_i == 2'b00)
                                  ? `PCX_SZ_1B
                                  : (size_op_i == 2'b01)
                                    ? `PCX_SZ_2B
                                    : (size_op_i == 2'b10)
                                      ? `PCX_SZ_4B
                                      : `PCX_SZ_8B;
            transducer_l15_address = miss_addr_i;
            /* TODO: This should replicate based on size */
            transducer_l15_data = (size_op_i == 2'b00)
                                  ? {8{store_data_i[0+:8]}}
                                  : (size_op_i == 2'b01)
                                    ? {4{store_data_i[0+:16]}}
                                    : (size_op_i == 2'b10)
                                      ? {2{store_data_i[0+:32]}}
                                      : {1{store_data_i[0+:64]}};
            transducer_l15_l1rplway = lru_way_i[1:0];
            transducer_l15_val = 1'b1;

            state_n = l15_transducer_ack ? e_store : e_store_send;
          end
        e_store:
          begin
            transducer_l15_req_ack = (l15_transducer_val & (l15_transducer_returntype == `ST_ACK));

            miss_yumi_o = l15_transducer_val;

            state_n = l15_transducer_val ? e_ready : e_store;
          end
        default: begin end
      endcase
    end

  always_ff @(posedge clk_i)
    if (reset_i)
      state_r <= e_reset;
    else
      state_r <= state_n;

  assign data_mem_pkt.index = miss_addr_i[block_offset_width_lp+:index_width_lp];
  assign data_mem_pkt.way_id = lru_way_i;
  assign data_mem_pkt.data = uncached_i ? load_uncached_i : load_cacheline_lo;
  assign data_mem_pkt.opcode = e_dcache_lce_data_mem_write;

  assign tag_mem_pkt.index = (state_r inside {e_isync, e_dsync})
                             ? inv_addr_li[block_offset_width_lp+:index_width_lp]
                             : miss_addr_i[block_offset_width_lp+:index_width_lp];
  assign tag_mem_pkt.way_id = (state_r inside {e_isync, e_dsync})
                              ? '0
                              : lru_way_i;
  assign tag_mem_pkt.state = '0;
  assign tag_mem_pkt.tag = (state_r inside {e_isync, e_dsync})
                           ? inv_addr_li[paddr_width_p-1-:ptag_width_p]
                           : miss_addr_i[paddr_width_p-1-:ptag_width_p];
  assign tag_mem_pkt.opcode = (state_r inside {e_isync, e_dsync}) 
                              ? e_dcache_lce_tag_mem_set_clear 
                              : e_dcache_lce_tag_mem_set_tag;

  assign stat_mem_pkt.index = inv_addr_li[block_offset_width_lp+:index_width_lp];
  assign stat_mem_pkt.way_id = (state_r inside {e_isync, e_dsync})
                               ? '0
                               : lru_way_i;
  assign stat_mem_pkt.opcode = e_dcache_lce_stat_mem_set_clear;

  // BP -> L1.15
  // L1.5 -> BP
  assign data_mem_pkt_o = data_mem_pkt;
  assign tag_mem_pkt_o = tag_mem_pkt;
  assign stat_mem_pkt_o = stat_mem_pkt;

  // Unused by BlackParrot
  assign transducer_l15_amo_op = '0;
  assign transducer_l15_threadid = '0;
  assign transducer_l15_prefetch = '0;
  assign transducer_l15_invalidate_cacheline = '0;
  assign transducer_l15_blockstore = '0;
  assign transducer_l15_blockinitstore = '0;
  assign transducer_l15_data_next_entry = '0;
  assign transducer_l15_csm_data = '0;

endmodule 
  
