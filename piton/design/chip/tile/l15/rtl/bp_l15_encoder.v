
`include "iop.h"
module bp_l15_encoder
  (input clk_i
   , input reset_i

   , input [39:0]                                      transducer_l15_address
   , output                                            transducer_l15_req_ack

   , input                                             l15_transducer_val
   , input [3:0]                                       l15_transducer_returntype

   , input [63:0]                                      l15_transducer_data_0
   , input [63:0]                                      l15_transducer_data_1

   // L1.5 -> BP
   );

   /*
  `declare_bp_me_if(paddr_width_p, cce_block_width_p, num_lce_p, lce_assoc_p, mem_payload_width_p)

  bp_mem_cce_resp_s mem_resp_cast_o;
  bp_mem_cce_data_resp_s mem_data_resp_cast_o;

  assign mem_resp_o = mem_resp_cast_o;
  assign mem_data_resp_o = mem_data_resp_cast_o;

  logic [mem_payload_width_p-1:0] mem_payload_lo;
  logic [paddr_width_p-1:0] mem_paddr_lo;
  bp_lce_cce_nc_req_size_e nc_size_lo;

  wire load_not_store = (l15_transducer_returntype == `LOAD_RET);
  always_comb
    begin
      if (load_not_store)
        begin
          mem_data_resp_cast_o.msg_type      = e_lce_req_type_rd;
          mem_data_resp_cast_o.addr          = mem_paddr_lo;
          mem_data_resp_cast_o.payload       = mem_payload_lo;
          mem_data_resp_cast_o.non_cacheable = 1'b0; // We don't support OpenPiton uncached yet
          mem_data_resp_cast_o.nc_size       = nc_size_lo;
          mem_data_resp_cast_o.data          = {l15_transducer_data_1, l15_transducer_data_0};
        end
      else
        begin
          mem_resp_cast_o.msg_type      = e_lce_req_type_wr;
          mem_resp_cast_o.addr          = mem_paddr_lo;
          mem_resp_cast_o.payload       = mem_payload_lo;
          mem_resp_cast_o.non_cacheable = 1'b0;
          mem_resp_cast_o.nc_size       = nc_size_lo;
        end
    end

assign mem_resp_v_o = mem_resp_ready_i & l15_transducer_val & ~load_not_store;
assign mem_data_resp_v_o = mem_data_resp_ready_i & l15_transducer_val & load_not_store;

bsg_one_fifo
 #(.width_p(mem_payload_width_p+paddr_width_p+$bits(bp_lce_cce_nc_req_size_e)))
 save_queue
  (.clk_i(clk_i)
   ,.reset_i(reset_i)

   ,.data_i({mem_payload, transducer_l15_address, nc_size})
   ,.v_i(transducer_l15_req_ack)
   ,.ready_o()

   ,.data_o({mem_payload_lo, mem_paddr_lo, nc_size_lo})
   ,.v_o()
   ,.yumi_i(l15_transducer_val)
   );
   */

endmodule 
  
