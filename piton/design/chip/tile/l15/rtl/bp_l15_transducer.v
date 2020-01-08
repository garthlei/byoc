

module bp_l15_transducer
  (input clk_i
   , input reset_i

   // BP -> L1.5 

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
  
