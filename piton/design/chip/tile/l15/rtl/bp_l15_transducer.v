

module bp_l15_transducer
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
   , output                                            transducer_l15_nc
   , input                                             l15_transducer_ack
   , input                                             l15_transducer_header_ack

   , input                                             l15_transducer_val
   , input [3:0]                                       l15_transducer_returntype
   , input [63:0]                                      l15_transducer_data_0
   , input [63:0]                                      l15_transducer_data_1
   , output logic                                      transducer_l15_req_ack

   // Unused OpenPiton side connections
   , output [3:0]                                      transducer_l15_amo_op
   , output [0:0]                                      transducer_l15_threadid
   , output                                            transducer_l15_prefetch
   , output                                            transducer_l15_invalidate_cacheline
   , output                                            transducer_l15_blockstore
   , output                                            transducer_l15_blockinitstore
   , output [1:0]                                      transducer_l15_l1rplway
   , output [63:0]                                     transducer_l15_data_next_entry
   , output [`TLB_CSM_WIDTH-1:0]                       transducer_l15_csm_data

   // L1.5 -> BP
   , output [522:0]                                    data_mem_pkt_o
   , output                                            data_mem_pkt_v_o
   , input                                             data_mem_pkt_yumi_i

   , output [41:0]                                     tag_mem_pkt_o
   , output                                            tag_mem_pkt_v_o
   , input                                             tag_mem_pkt_yumi_i

   , output [10:0]                                     stat_mem_pkt_o
   , output                                            stat_mem_pkt_v_o
   , input                                             stat_mem_pkt_yumi_i
   );

  enum logic [1:0]
  {
    e_reset
    ,e_ready
    ,e_send
    ,e_recv
  } state_n, state_r;

  wire [39:0] miss_fifo_li = miss_addr_i;
  wire miss_fifo_v_li = load_miss_i;
  logic miss_fifo_ready_lo;
  logic [39:0] miss_addr_lo;
  logic miss_v_lo, miss_yumi_li;
  bsg_one_fifo
   #(.width_p(40))
   miss_fifo
    (.clk_i(clk_i)
     ,.reset_i(reset_i)
     
     ,.data_i(miss_fifo_li)
     ,.v_i(miss_fifo_v_li)
     ,.ready_o(miss_fifo_ready_lo)

     ,.data_o(miss_addr_lo)
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

  logic [`BSG_WIDTH(4)-1:0] miss_cnt;
  logic miss_up_li;
  wire miss_clr_li = load_cacheline_yumi_li;
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

  always_comb
    begin
      ready_o = 1'b0;

      transducer_l15_rqtype = '0;
      transducer_l15_size = '0;
      transducer_l15_address = '0;
      transducer_l15_data = '0;
      transducer_l15_val = '0;

      transducer_l15_req_ack = '0;

      miss_up_li = '0;

      miss_data_li = '0;
      miss_data_v_li = '0;

      load_cacheline_yumi_li = '0;

      unique case (state_r)
        e_reset:
          begin
            transducer_l15_req_ack = (l15_transducer_val & (l15_transducer_returntype == `INT_RET));

            state_n = transducer_l15_req_ack ? e_ready : e_reset;
          end
        e_ready:
          begin
            ready_o = miss_fifo_ready_lo;

            state_n = miss_v_lo ? e_recv : e_ready;
          end
        e_recv:
          begin
            transducer_l15_rqtype = `L15_REQTYPE_LOAD;
            transducer_l15_size = `PCX_REQTYPE_LOAD;
            transducer_l15_address = miss_addr_lo + (miss_cnt << `BSG_SAFE_CLOG2(128));
            transducer_l15_val = 1'b1;

            transducer_l15_req_ack = (l15_transducer_val & (l15_transducer_returntype == `LOAD_RET));

            miss_up_li = transducer_l15_req_ack;

            miss_data_li = {l15_transducer_data_1, l15_transducer_data_0};
            miss_data_v_li = transducer_l15_req_ack;

            load_cacheline_yumi_li = miss_yumi_li;

            state_n = miss_yumi_li ? e_ready : e_recv;
          end
        e_send:
          begin

          end
        default: begin end
      endcase
    end

  always_ff @(posedge clk_i)
    if (reset_i)
      state_r <= e_reset;
    else
      state_r <= state_n;

  // BP -> L1.15

  // Currently unused by BlackParrot
  assign transducer_l15_nc = '0;

  // Unused by BlackParrot
  assign transducer_l15_amo_op = '0;
  assign transducer_l15_threadid = '0;
  assign transducer_l15_prefetch = '0;
  assign transducer_l15_invalidate_cacheline = '0;
  assign transducer_l15_blockstore = '0;
  assign transducer_l15_blockinitstore = '0;
  assign transducer_l15_l1rplway = '0;
  assign transducer_l15_data_next_entry = '0;
  assign transducer_l15_csm_data = '0;


  // L1.5 -> BP
  assign data_mem_pkt_o = '0;
  assign data_mem_pkt_v_o = '0;

  assign tag_mem_pkt_o = '0;
  assign tag_mem_pkt_v_o = '0;

  assign stat_mem_pkt_o = '0;
  assign stat_mem_pkt_v_o = '0;


endmodule 
  
