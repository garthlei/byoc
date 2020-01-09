// ========== Copyright Header Begin ============================================
// Copyright (c) 2017 Princeton University
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in the
//       documentation and/or other materials provided with the distribution.
//     * Neither the name of Princeton University nor the
//       names of its contributors may be used to endorse or promote products
//       derived from this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY PRINCETON UNIVERSITY "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL PRINCETON UNIVERSITY BE LIABLE FOR ANY
// DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
// ========== Copyright Header End ============================================

//--------------------------------------------------
// Description:     Top level for FPGA MAC
// Author:          Alexey Lavrov
// Company:         Princeton University
// Created:         1/25/2017
//--------------------------------------------------

module nvlink_top #(
    parameter AXI_ADDR_WIDTH   = 32,
    parameter AXI_DATA_WIDTH   = 32,
    parameter AXI_USER_WIDTH   = 6,
    parameter AXI_ID_WIDTH     = 6,
    parameter APB_ADDR_WIDTH   = 32,
    parameter APB_DATA_WIDTH   = 32,
    parameter SWAP_ENDIANESS = 0
) (
    input                                   chipset_clk,

    input                                   rst_n,

    output                                  net_interrupt,

    input                                   noc2_in_val,
    input       [`NOC_DATA_WIDTH-1:0]       noc2_in_data,
    output                                  noc2_in_rdy,

    output                                  noc3_out_val,
    output      [`NOC_DATA_WIDTH-1:0]       noc3_out_data,
    input                                   noc3_out_rdy
   
//`ifdef PITON_FPGA_NVDLA
    ,
    output                                  noc2_out_val,
    output      [`NOC_DATA_WIDTH-1:0]       noc2_out_data,
    input                                   noc2_out_rdy,

    input                                   noc3_in_val,
    input       [`NOC_DATA_WIDTH-1:0]       noc3_in_data,
    output                                  noc3_in_rdy
//`endif


);

//`ifdef PITON_FPGA_NVDLA

 


// apb <-> axi
//axilite signals
wire [31:0]                     apb_axi_awaddr;
wire                            apb_axi_awvalid;
wire                            apb_axi_awready;

wire [31:0]                     apb_axi_wdata;
wire [3:0]                      apb_axi_wstrb;
wire                            apb_axi_wvalid;
wire                            apb_axi_wready;

wire [1:0]                      apb_axi_bresp;
wire                            apb_axi_bvalid;
wire                            apb_axi_bready;

wire [31:0]                     apb_axi_araddr;
wire                            apb_axi_arvalid;
wire                            apb_axi_arready;

wire [31:0]                     apb_axi_rdata;
wire [1:0]                      apb_axi_rresp;
wire                            apb_axi_rvalid;
wire                            apb_axi_rready;

// noc <-> axi
//axilite signals
wire [31:0]                     noc_axi_awaddr;
wire                            noc_axi_awvalid;
wire                            noc_axi_awready;

wire [63:0]                     noc_axi_wdata;
wire [7:0]                      noc_axi_wstrb;
wire                            noc_axi_wvalid;
wire                            noc_axi_wready;

wire [1:0]                      noc_axi_bresp;
wire                            noc_axi_bvalid;
wire                            noc_axi_bready;

wire [31:0]                     noc_axi_araddr;
wire                            noc_axi_arvalid;
wire                            noc_axi_arready;

wire [63:0]                     noc_axi_rdata;
wire [1:0]                      noc_axi_rresp;
wire                            noc_axi_rvalid;
wire                            noc_axi_rready;

//apb signals
wire 			        penable;
wire       			pwrite;
wire [APB_ADDR_WIDTH-1:0] 	paddr;
wire 			        psel;
wire [AXI_DATA_WIDTH-1:0] 	pwdata;
wire [APB_DATA_WIDTH-1:0] 	prdata;
wire 			        pready;
wire 			        pslverr;
 

//Unused axi2apb outputs
wire [AXI_ID_WIDTH-1:0] 	b_dump_id;
wire [AXI_USER_WIDTH-1:0] 	b_dump_user;  

wire [AXI_ID_WIDTH-1:0] 	r_dump_id;
wire [AXI_USER_WIDTH-1:0] 	r_dump_user; 
wire 			        r_dump_last;
 

//Unused axi2apb wires
wire test_en_i = 1'b0;
wire blank_id  = 6'b0;
wire blank_len = 8'b0;
wire blank_size = 3'b0;
wire blank_burst = 2'b0;
wire blank_lock = 1'b0;
wire blank_cache = 4'b0;
wire blank_prot = 3'b0;
wire blank_user = 6'b0;
wire blank_qos = 4'b0;
wire blank_last = 1'b0;
wire blank_region = 4'b0;
   

//Test
   //assign prdata = 32'b1110;
   //assign pready = 1'b1;
   //assign pslverr = 1'b0;
   

//CPU -->AXILITE
noc_axilite_bridge #(
    .SLAVE_RESP_BYTEWIDTH   (4),
    .SWAP_ENDIANESS         (SWAP_ENDIANESS)
)  noc_nvlink_bridge (
    .clk                    (chipset_clk        ),
    .rst                    (~rst_n             ),      // TODO: rewrite to positive ?

    .splitter_bridge_val    (noc2_in_val           ),
    .splitter_bridge_data   (noc2_in_data          ),
    .bridge_splitter_rdy    (noc2_in_rdy           ),   // CRAZY NAMING !

    .bridge_splitter_val    (noc3_out_val          ),
    .bridge_splitter_data   (noc3_out_data         ),
    .splitter_bridge_rdy    (noc3_out_rdy          ),   // CRAZY NAMING !

    //axi lite signals
    //write address channel
    .m_axi_awaddr        (apb_axi_awaddr),
    .m_axi_awvalid       (apb_axi_awvalid),
    .m_axi_awready       (apb_axi_awready),

    //write data channel
    .m_axi_wdata         (apb_axi_wdata),
    .m_axi_wstrb         (apb_axi_wstrb),
    .m_axi_wvalid        (apb_axi_wvalid),
    .m_axi_wready        (apb_axi_wready),

    //read address channel
    .m_axi_araddr        (apb_axi_araddr),
    .m_axi_arvalid       (apb_axi_arvalid),
    .m_axi_arready       (apb_axi_arready),

    //read data channel
    .m_axi_rdata         (apb_axi_rdata),
    .m_axi_rresp         (apb_axi_rresp),
    .m_axi_rvalid        (apb_axi_rvalid),
    .m_axi_rready        (apb_axi_rready),

    //write response channel
    .m_axi_bresp         (apb_axi_bresp),
    .m_axi_bvalid        (apb_axi_bvalid),
    .m_axi_bready        (apb_axi_bready)
);


//AXILITE -->APB
axi2apb #(
            .AXI4_ADDRESS_WIDTH ( AXI_ADDR_WIDTH ),
            .AXI4_RDATA_WIDTH   ( AXI_DATA_WIDTH ),
            .AXI4_WDATA_WIDTH   ( AXI_DATA_WIDTH ),
            .AXI4_ID_WIDTH      ( AXI_ID_WIDTH   ),
            .AXI4_USER_WIDTH    ( AXI_USER_WIDTH ),

            .BUFF_DEPTH_SLAVE   ( 2              ),
            .APB_ADDR_WIDTH     ( APB_ADDR_WIDTH )
        ) axi2apb_nvlink (
            .ACLK       ( chipset_clk            ),
            .ARESETn    ( rst_n                 ),
            .test_en_i  ( test_en_i              ), 

            .AWID_i     ( blank_id               ), 
            .AWADDR_i   ( apb_axi_awaddr         ),
            .AWLEN_i    ( blank_len              ), 
            .AWSIZE_i   ( blank_size             ), 
            .AWBURST_i  ( blank_burst            ), 
            .AWLOCK_i   ( blank_lock             ),
            .AWCACHE_i  ( blank_cache            ),
            .AWPROT_i   ( blank_prot             ),
            .AWREGION_i ( blank_region           ),
            .AWUSER_i   ( blank_user             ),
            .AWQOS_i    ( blank_qos              ),
            .AWVALID_i  ( apb_axi_awvalid        ),
            .AWREADY_o  ( apb_axi_awready        ),

            .WDATA_i    ( apb_axi_wdata          ),
            .WSTRB_i    ( apb_axi_wstrb          ),
            .WLAST_i    ( blank_last             ),
            .WUSER_i    ( blank_user             ),
            .WVALID_i   ( apb_axi_wvalid         ),
            .WREADY_o   ( apb_axi_wready         ),

            .BID_o      ( b_dump_id                ),
            .BRESP_o    ( apb_axi_bresp          ),
            .BVALID_o   ( apb_axi_bvalid         ),
            .BUSER_o    ( b_dump_user              ),
            .BREADY_i   ( apb_axi_bready         ),

            .ARID_i     ( blank_id               ),
            .ARADDR_i   ( apb_axi_araddr         ),
            .ARLEN_i    ( blank_len              ),
            .ARSIZE_i   ( blank_size             ),
            .ARBURST_i  ( blank_burst            ),
            .ARLOCK_i   ( blank_lock             ),
            .ARCACHE_i  ( blank_cache            ),
            .ARPROT_i   ( blank_prot             ),
            .ARREGION_i ( blank_region           ),
            .ARUSER_i   ( blank_user             ),
            .ARQOS_i    ( blank_qos              ),
            .ARVALID_i  ( apb_axi_arvalid        ),
            .ARREADY_o  ( apb_axi_arready        ),

            .RID_o      ( r_dump_id              ),
            .RDATA_o    ( apb_axi_rdata          ),
            .RRESP_o    ( apb_axi_rresp          ),
            .RLAST_o    ( r_dump_last            ),
            .RUSER_o    ( r_dump_user            ),
            .RVALID_o   ( apb_axi_rvalid         ),
            .RREADY_i   ( apb_axi_rready         ),

            .PENABLE    ( penable                ),
            .PWRITE     ( pwrite                 ),
            .PADDR      ( paddr                  ),
            .PSEL       ( psel                   ),
            .PWDATA     ( pwdata                 ),
            .PRDATA     ( prdata                 ),
            .PREADY     ( pready                 ),
            .PSLVERR    ( pslverr                )
        );

   //AXILITE --> CPU
axilite_noc_bridge #(
    .SLAVE_RESP_BYTEWIDTH   (4),
    .SWAP_ENDIANESS         (SWAP_ENDIANESS),
    .NOCDECODER_DP_DATA_WIDTH (4)
)  nvlink_noc_bridge (
    .clk                    (chipset_clk        ),
    .rst                    (~rst_n             ),      

    .bridge_splitter_val    (noc2_out_val          ),
    .bridge_splitter_data   (noc2_out_data         ),
    .splitter_bridge_rdy    (noc2_out_rdy          ), 

    .splitter_bridge_val    (noc3_in_val           ),
    .splitter_bridge_data   (noc3_in_data          ),
    .bridge_splitter_rdy    (noc3_in_rdy           ),   


    //axi lite signals
    //write address channel
    .axi_awaddr        (noc_axi_awaddr),
    .axi_awvalid       (noc_axi_awvalid),
    .axi_awready       (noc_axi_awready),

    //write data channel
    .axi_wdata         (noc_axi_wdata),
    .axi_wstrb         (noc_axi_wstrb),
    .axi_wvalid        (noc_axi_wvalid),
    .axi_wready        (noc_axi_wready),

    //read address channel
    .axi_araddr        (noc_axi_araddr),
    .axi_arvalid       (noc_axi_arvalid),
    .axi_arready       (noc_axi_arready),

    //read data channel
    .axi_rdata         (noc_axi_rdata),
    .axi_rresp         (noc_axi_rresp),
    .axi_rvalid        (noc_axi_rvalid),
    .axi_rready        (noc_axi_rready),

    //write response channel
    .axi_bresp         (noc_axi_bresp),
    .axi_bvalid        (noc_axi_bvalid),
    .axi_bready        (noc_axi_bready)
);

//`ifdef PITON_FPGA_NVDLA
//APB -->NVDLA
NV_NVDLA_wrapper  NV_NVDLA_nvlink (
    .dla_core_clk   (chipset_clk        ),
    .dla_csb_clk    (chipset_clk        ),      // TODO: rewrite to positive ?
    .dla_reset_rstn ( rst_n             ),
    .direct_reset   (~rst_n             ),

    //apb signals
    .psel           (psel                  ),
    .penable        (penable               ),
    .pwrite         (pwrite                ),   // CRAZY NAMING !
    .paddr          (paddr                 ),
    .pwdata         (pwdata                ),
    .prdata         (prdata                ),
    .pready         (pready                ),
    .pslverr        (pslverr               ),

    //axi signals
    .nvdla_core2dbb_awvalid            ( noc_axi_awvalid ),
    .nvdla_core2dbb_awready            ( noc_axi_awready ), 
    .nvdla_core2dbb_awid               (  ),
    .nvdla_core2dbb_awlen              (  ),
    .nvdla_core2dbb_awaddr             ( noc_axi_awaddr  ),
				   
    .nvdla_core2dbb_wvalid             ( noc_axi_wvalid ),
    .nvdla_core2dbb_wready             ( noc_axi_wready ),
    .nvdla_core2dbb_wdata              ( noc_axi_wdata ),
    .nvdla_core2dbb_wstrb              ( noc_axi_wstrb ),
    .nvdla_core2dbb_wlast              (  ),
				   
    .nvdla_core2dbb_arvalid            ( noc_axi_arvalid ),
    .nvdla_core2dbb_arready            ( noc_axi_arready ),
    .nvdla_core2dbb_arid               (  ),
    .nvdla_core2dbb_arlen              (  ),
    .nvdla_core2dbb_araddr             ( noc_axi_araddr ),
				   
    .nvdla_core2dbb_bresp              ( noc_axi_bresp   ),
    .nvdla_core2dbb_bvalid             ( noc_axi_bvalid ),
    .nvdla_core2dbb_bready             ( noc_axi_bready ),
    .nvdla_core2dbb_bid                (  ),
				   
    .nvdla_core2dbb_rvalid             ( noc_axi_rvalid ),
    .nvdla_core2dbb_rready             ( noc_axi_rready ),
    .nvdla_core2dbb_rid                (  ),
    .nvdla_core2dbb_rlast              (  ),
    .nvdla_core2dbb_rdata              ( noc_axi_rdata ),
    .nvdla_core2dbb_rresp              ( noc_axi_rresp ),
				   
    .nvdla_core2dbb_awsize             (  ),
    .nvdla_core2dbb_arsize             (  ),
    .nvdla_core2dbb_awburst            (  ),
    .nvdla_core2dbb_arburst            (  ),
    .nvdla_core2dbb_awlock             (  ),
    .nvdla_core2dbb_arlock             (  ),
    .nvdla_core2dbb_awcache            (  ),
    .nvdla_core2dbb_arcache            (  ),
    .nvdla_core2dbb_awprot             (  ),
    .nvdla_core2dbb_arprot             (  ),
    .nvdla_core2dbb_awqos              (  ),
    .nvdla_core2dbb_awatop             (  ),
    .nvdla_core2dbb_awregion           (  ),
    .nvdla_core2dbb_arqos              (  ),
    .nvdla_core2dbb_arregion           (  ),
				   
   //General Output Signal
   .dla_intr                           (                 )
);

//`else   // PITON_FPGA_ETHERNETLITE

//    assign noc2_in_rdy    = 1'b0;
//    assign noc3_out_val    = 1'b0;
//    assign noc3_out_data   = {`NOC_DATA_WIDTH{1'b0}};



//`endif  // PITON_FPGA_ETHERNETLITE

endmodule
