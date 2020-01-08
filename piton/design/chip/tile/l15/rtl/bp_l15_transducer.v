

module bp_l15_transducer
  (input clk_i
   , input reset_i

   // BP -> L1.5
   //
   // Status signals
   , output                                            ready_o
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
   , output [4:0]                                      transducer_l15_rqtype
   , output [2:0]                                      transducer_l15_size
   , output                                            transducer_l15_val
   , output [39:0]                                     transducer_l15_address
   , output [63:0]                                     transducer_l15_data
   , output                                            transducer_l15_nc
   , input                                             l15_transducer_ack
   , input                                             l15_transducer_header_ack

   , input                                             l15_transducer_val
   , input [3:0]                                       l15_transducer_returntype
   , input [63:0]                                      l15_transducer_data_0
   , input [63:0]                                      l15_transducer_data_1
   , output                                            transducer_l15_req_ack

   // Unused OpenPiton side connections
   , output [3:0]                                      transducer_l15_amo_op
   , output [0:0]                                      transducer_l15_threadid
   , output                                            transducer_l15_prefetch
   , output                                            transducer_l15_invalidate_cacheline
   , output                                            transducer_l15_blockstore
   , output                                            transducer_l15_blockinitstore
   , output                                            transducer_l15_l1rplway
   , output                                            transducer_l15_data_next_entry
   , output                                            transducer_l15_csm_data

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

   /*
logic [mem_payload_width_p-1:0] mem_payload;
bp_lce_cce_nc_req_size_e nc_size;

// BP -> L1.15
bp_l15_decoder #(.cfg_p(cfg_p)) l15_decoder (.*);

// L1.5 -> BP
bp_l15_encoder #(.cfg_p(cfg_p)) l15_encoder (.*);
*/

endmodule 
  
