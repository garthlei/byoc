set obj [get_filesets sources_1]
set BLACKPARROT_RTL_IMPL_FILES [list \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_noc/bsg_wormhole_router.vh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_noc/bsg_noc_links.vh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_defines.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_adder_cin.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_buf_ctrl.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_nor2.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_common/src/include/bp_common_csr_defines.vh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_common/src/include/bp_common_rv64_defines.vh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_common/src/include/bp_common_rv64_pkg.vh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_calculator/bp_be_bypass.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_common/src/include/bp_common_me_if.vh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_common/src/include/bp_common_fe_be_if.vh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_common/src/include/bp_common_defines.vh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_common/src/include/bp_common_pkg.vh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_common/src/include/bp_common_aviary_defines.vh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_common/src/include/bp_common_aviary_pkg.vh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/include/bp_be_internal_if_defines.vh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/include/bp_be_ctl_defines.vh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/include/bp_be_mem_defines.vh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/include/bp_be_pkg.vh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_calculator/bp_be_calculator_top.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_common/src/include/bp_common_cfg_link_pkg.vh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_mem/bp_be_csr.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/include/bp_be_dcache_wbuf_entry.vh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/include/bp_be_dcache_pkt.vh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/include/bp_be_dcache_pkg.vh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/include/bp_be_dcache_pipeline.vh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_mem/bp_be_dcache/bp_be_dcache.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_mem/bp_be_dcache/bp_be_dcache_decoder.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_mem/bp_be_dcache/bp_be_dcache_wbuf.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_mem/bp_be_dcache/bp_be_dcache_wbuf_queue.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_checker/bp_be_detector.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_checker/bp_be_director.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_calculator/bp_be_instr_decoder.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_calculator/bp_be_int_alu.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_calculator/bp_be_pipe_ctrl.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_calculator/bp_be_pipe_fp.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_calculator/bp_be_pipe_int.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_calculator/bp_be_pipe_long.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_calculator/bp_be_pipe_mem.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_calculator/bp_be_pipe_mul.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_calculator/bp_be_pipe_sys.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_mem/bp_be_ptw.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_calculator/bp_be_regfile.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_checker/bp_be_scheduler.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_top.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/include/v/bp_me_cce_mem_if.vh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/include/v/bp_me_pkg.vh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/include/v/bp_cce_inst.vh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/include/v/bp_cce_pkg.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/include/v/bp_pce_l15_if.vh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/include/v/bp_pce_pkg.vh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_noc/bsg_noc_pkg.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_noc/bsg_wormhole_router_pkg.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_cacc_complex.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_cce.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_cce_alu.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_cce_arbitrate.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_cce_branch.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_cce_dir.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_cce_dir_lru_extract.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_cce_dir_segment.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_cce_dir_tag_checker.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_cce_fsm.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_cce_gad.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_cce_inst_decode.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_cce_inst_predecode.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_cce_inst_ram.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_cce_inst_stall.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/test/common/bp_cce_mmio_cfg_loader.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_cce_msg.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_cce_pending_bits.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_cce_reg.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_cce_spec_bits.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_cce_src_sel.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_cce_wrapper.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_cfg.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_clint_slice.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_fe/src/include/bp_fe_mem_defines.vh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_fe/src/include/bp_fe_defines.vh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_fe/src/include/bp_fe_icache.vh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_fe/src/include/bp_fe_pkg.vh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_core.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_core_complex.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_fe/src/include/bp_fe_icache_pkg.vh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_core_minimal.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_fe/src/v/bp_fe_bht.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_fe/src/v/bp_fe_btb.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_fe/src/v/bp_fe_icache.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_fe/src/v/bp_fe_instr_scan.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_fe/src/v/bp_fe_mem.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_fe/src/v/bp_fe_pc_gen.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_fe/src/v/bp_fe_top.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/lce/bp_lce.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/lce/bp_lce_req.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/lce/bp_lce_cmd.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_pce.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_io_cce.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_io_complex.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_io_link_to_lce.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_io_tile.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_io_tile_node.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/wormhole/bp_me_addr_to_cce_id.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_cache/bsg_cache_pkg.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cache/bp_me_cache_dma_to_cce.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cache/bp_me_cache_slice.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/wormhole/bp_me_cce_id_to_cord.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cache/bp_me_cce_to_cache.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cache/bp_me_cce_to_cache_dma.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/wormhole/bp_me_cce_to_mem_link_bidir.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/include/v/bp_mem_wormhole.vh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/wormhole/bp_me_cce_to_mem_link_client.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/wormhole/bp_me_cce_to_mem_link_master.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/wormhole/bp_me_cord_to_id.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/wormhole/bp_me_lce_id_to_cord.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/wormhole/bp_me_wormhole_packet_encode_lce_cmd.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/wormhole/bp_me_wormhole_packet_encode_lce_req.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/wormhole/bp_me_wormhole_packet_encode_lce_resp.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/wormhole/bp_me_wormhole_packet_encode_mem_cmd.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/wormhole/bp_me_wormhole_packet_encode_mem_resp.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_mem_complex.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_nd_socket.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_common/src/v/bp_pma.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_multicore.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_unicore.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_sacc_complex.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_tile.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_tile_node.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_piton_top.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_common/src/v/bp_tlb.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_arb_fixed.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_adder_one_hot.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_array_concentrate_static.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_array_reverse.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_async/bsg_async_fifo.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bsg_async_noc_link.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_async/bsg_async_ptr_gray.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_buf.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_cache/bsg_cache.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_cache/bsg_cache_decode.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_cache/bsg_cache_dma.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_cache/bsg_cache_miss.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_cache/bsg_cache_sbuf.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_cache/bsg_cache_sbuf_queue.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_cache/bsg_cache_to_axi.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_cache/bsg_cache_to_axi_rx.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_cache/bsg_cache_to_axi_tx.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_mem/bsg_cam_1r1w.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_mem/bsg_cam_1r1w_replacement.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_mem/bsg_cam_1r1w_sync.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_mem/bsg_cam_1r1w_tag_array.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_circular_ptr.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_clkgate_optional.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_concentrate_static.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_counter_clear_up.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_counter_set_down.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_counter_set_en.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_counter_up_down.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_counter_up_down_variable.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_crossbar_o_by_i.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_decode.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_decode_with_v.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_dff.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_dff_chain.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_dff_en.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_dff_en_bypass.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_dff_reset_en_bypass.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_dff_reset.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_dff_reset_en.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_dff_reset_set_clear.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_dlatch.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_edge_detect.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_encode_one_hot.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_expand_bitmask.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_common/src/v/bsg_fifo_1r1w_rolly.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_dataflow/bsg_fifo_1r1w_small.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_dataflow/bsg_fifo_1r1w_small_hardened.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_dataflow/bsg_fifo_1r1w_small_unhardened.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_dataflow/bsg_fifo_tracker.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_dataflow/bsg_flow_counter.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_hash_bank.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_idiv_iterative.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_idiv_iterative_controller.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_async/bsg_launch_sync_sync.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_lru_pseudo_tree_decode.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_lru_pseudo_tree_encode.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_mem/bsg_mem_1r1w.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_mem/bsg_mem_1r1w_one_hot.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_mem/bsg_mem_1r1w_sync.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_mem/bsg_mem_1r1w_sync_synth.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_mem/bsg_mem_1r1w_synth.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_mem/bsg_mem_1rw_sync.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/hard/ultrascale_plus/bsg_mem/bsg_mem_1rw_sync_mask_write_bit.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_mem/bsg_mem_1rw_sync_mask_write_byte.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_mem/bsg_mem_1rw_sync_mask_write_byte_synth.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_mem/bsg_mem_1rw_sync_synth.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_mem/bsg_mem_2r1w_sync.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_mem/bsg_mem_2r1w_sync_synth.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_noc/bsg_mesh_stitch.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_mux.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_mux_bitwise.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_mux_butterfly.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_mux_one_hot.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_mux_segmented.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_muxi2_gatestack.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_nand.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_nor3.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_dataflow/bsg_one_fifo.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_dataflow/bsg_parallel_in_serial_out.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_dataflow/bsg_parallel_in_serial_out_dynamic.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_priority_encode.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_priority_encode_one_hot_out.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_reduce.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_reduce_segmented.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_rotate_left.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_rotate_right.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_dataflow/bsg_round_robin_1_to_n.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_round_robin_arb.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_dataflow/bsg_round_robin_n_to_1.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_scan.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_dataflow/bsg_serial_in_parallel_out.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_dataflow/bsg_serial_in_parallel_out_dynamic.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_dataflow/bsg_serial_in_parallel_out_full.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_dataflow/bsg_shift_reg.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_strobe.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_swap.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_transpose.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_dataflow/bsg_two_fifo.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_unconcentrate_static.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_noc/bsg_wormhole_concentrator.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_noc/bsg_wormhole_concentrator_in.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_noc/bsg_wormhole_concentrator_out.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_noc/bsg_wormhole_router.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_noc/bsg_wormhole_router_adapter.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_noc/bsg_wormhole_router_adapter_in.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_noc/bsg_wormhole_router_adapter_out.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_noc/bsg_wormhole_router_decoder_dor.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_noc/bsg_wormhole_router_input_control.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_noc/bsg_wormhole_router_output_control.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_xnor.v" \
]
add_files -norecurse -fileset $obj $BLACKPARROT_RTL_IMPL_FILES

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_noc/bsg_wormhole_router.vh"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "Verilog Header" -objects $file_obj
set_property -name "is_global_include" -value "1" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_noc/bsg_noc_links.vh"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "Verilog Header" -objects $file_obj
set_property -name "is_global_include" -value "1" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_defines.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "Verilog Header" -objects $file_obj
set_property -name "is_global_include" -value "1" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_common/src/include/bp_common_csr_defines.vh"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "Verilog Header" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_common/src/include/bp_common_rv64_defines.vh"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "Verilog Header" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_common/src/include/bp_common_rv64_pkg.vh"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_calculator/bp_be_bypass.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_common/src/include/bp_common_me_if.vh"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "Verilog Header" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_common/src/include/bp_common_fe_be_if.vh"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "Verilog Header" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_common/src/include/bp_common_defines.vh"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "Verilog Header" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_common/src/include/bp_common_pkg.vh"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_common/src/include/bp_common_aviary_defines.vh"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "Verilog Header" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_common/src/include/bp_common_aviary_pkg.vh"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/include/bp_be_internal_if_defines.vh"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "Verilog Header" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/include/bp_be_ctl_defines.vh"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "Verilog Header" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/include/bp_be_mem_defines.vh"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "Verilog Header" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/include/bp_be_pkg.vh"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_calculator/bp_be_calculator_top.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_common/src/include/bp_common_cfg_link_pkg.vh"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_mem/bp_be_csr.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/include/bp_be_dcache_wbuf_entry.vh"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "Verilog Header" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/include/bp_be_dcache_pkt.vh"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "Verilog Header" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/include/bp_be_dcache_pkg.vh"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/include/bp_be_dcache_pipeline.vh"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_mem/bp_be_dcache/bp_be_dcache.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_mem/bp_be_dcache/bp_be_dcache_decoder.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_mem/bp_be_dcache/bp_be_dcache_wbuf.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_mem/bp_be_dcache/bp_be_dcache_wbuf_queue.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_checker/bp_be_detector.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_checker/bp_be_director.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_calculator/bp_be_instr_decoder.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_calculator/bp_be_int_alu.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_calculator/bp_be_pipe_ctrl.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_calculator/bp_be_pipe_fp.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_calculator/bp_be_pipe_int.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_calculator/bp_be_pipe_long.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_calculator/bp_be_pipe_mem.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_calculator/bp_be_pipe_mul.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_calculator/bp_be_pipe_sys.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_mem/bp_be_ptw.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_calculator/bp_be_regfile.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_checker/bp_be_scheduler.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_top.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/include/v/bp_me_cce_mem_if.vh"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "Verilog Header" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/include/v/bp_me_pkg.vh"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/include/v/bp_cce_inst.vh"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "Verilog Header" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/include/v/bp_cce_pkg.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/include/v/bp_pce_l15_if.vh"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "Verilog Header" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/include/v/bp_pce_pkg.vh"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_noc/bsg_noc_pkg.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_noc/bsg_wormhole_router_pkg.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_cacc_complex.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_cce.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_cce_alu.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_cce_arbitrate.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_cce_branch.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_cce_dir.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_cce_dir_lru_extract.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_cce_dir_segment.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_cce_dir_tag_checker.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_cce_fsm.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_cce_gad.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_cce_inst_decode.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_cce_inst_predecode.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_cce_inst_ram.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_cce_inst_stall.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/test/common/bp_cce_mmio_cfg_loader.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_cce_msg.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_cce_pending_bits.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_cce_reg.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_cce_spec_bits.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_cce_src_sel.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_cce_wrapper.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_cfg.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_clint_slice.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_fe/src/include/bp_fe_mem_defines.vh"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "Verilog Header" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_fe/src/include/bp_fe_defines.vh"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "Verilog Header" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_fe/src/include/bp_fe_icache.vh"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "Verilog Header" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_fe/src/include/bp_fe_pkg.vh"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_core.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_core_complex.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_fe/src/include/bp_fe_icache_pkg.vh"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_core_minimal.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_fe/src/v/bp_fe_bht.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_fe/src/v/bp_fe_btb.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_fe/src/v/bp_fe_icache.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_fe/src/v/bp_fe_instr_scan.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_fe/src/v/bp_fe_mem.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_fe/src/v/bp_fe_pc_gen.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_fe/src/v/bp_fe_top.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/lce/bp_lce.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/lce/bp_lce_req.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/lce/bp_lce_cmd.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_pce.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_io_cce.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_io_complex.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_io_link_to_lce.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_io_tile.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_io_tile_node.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/wormhole/bp_me_addr_to_cce_id.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_cache/bsg_cache_pkg.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cache/bp_me_cache_dma_to_cce.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cache/bp_me_cache_slice.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/wormhole/bp_me_cce_id_to_cord.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cache/bp_me_cce_to_cache.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cache/bp_me_cce_to_cache_dma.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/wormhole/bp_me_cce_to_mem_link_bidir.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/include/v/bp_mem_wormhole.vh"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "Verilog Header" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/wormhole/bp_me_cce_to_mem_link_client.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/wormhole/bp_me_cce_to_mem_link_master.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/wormhole/bp_me_cord_to_id.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/wormhole/bp_me_lce_id_to_cord.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/wormhole/bp_me_wormhole_packet_encode_lce_cmd.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/wormhole/bp_me_wormhole_packet_encode_lce_req.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/wormhole/bp_me_wormhole_packet_encode_lce_resp.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/wormhole/bp_me_wormhole_packet_encode_mem_cmd.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/wormhole/bp_me_wormhole_packet_encode_mem_resp.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_mem_complex.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_nd_socket.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_common/src/v/bp_pma.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_multicore.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_unicore.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_sacc_complex.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_tile.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_tile_node.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_piton_top.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_common/src/v/bp_tlb.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_arb_fixed.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_adder_one_hot.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_array_concentrate_static.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_array_reverse.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_async/bsg_async_fifo.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bsg_async_noc_link.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_async/bsg_async_ptr_gray.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_buf.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_cache/bsg_cache.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_cache/bsg_cache_decode.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_cache/bsg_cache_dma.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_cache/bsg_cache_miss.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_cache/bsg_cache_sbuf.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_cache/bsg_cache_sbuf_queue.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_cache/bsg_cache_to_axi.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_cache/bsg_cache_to_axi_rx.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_cache/bsg_cache_to_axi_tx.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_mem/bsg_cam_1r1w.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_mem/bsg_cam_1r1w_replacement.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_mem/bsg_cam_1r1w_sync.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_mem/bsg_cam_1r1w_tag_array.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_circular_ptr.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_clkgate_optional.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_concentrate_static.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_counter_clear_up.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_counter_set_down.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_counter_set_en.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_counter_up_down.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_counter_up_down_variable.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_crossbar_o_by_i.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_decode.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_decode_with_v.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_dff.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_dff_chain.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_dff_en.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_dff_en_bypass.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_dff_reset_en_bypass.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_dff_reset.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_dff_reset_en.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_dff_reset_set_clear.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_dlatch.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_edge_detect.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_encode_one_hot.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_expand_bitmask.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_common/src/v/bsg_fifo_1r1w_rolly.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_dataflow/bsg_fifo_1r1w_small.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_dataflow/bsg_fifo_1r1w_small_hardened.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_dataflow/bsg_fifo_1r1w_small_unhardened.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_dataflow/bsg_fifo_tracker.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_dataflow/bsg_flow_counter.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_hash_bank.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_idiv_iterative.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_idiv_iterative_controller.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_async/bsg_launch_sync_sync.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_lru_pseudo_tree_decode.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_lru_pseudo_tree_encode.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_mem/bsg_mem_1r1w.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_mem/bsg_mem_1r1w_one_hot.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_mem/bsg_mem_1r1w_sync.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_mem/bsg_mem_1r1w_sync_synth.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_mem/bsg_mem_1r1w_synth.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_mem/bsg_mem_1rw_sync.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/hard/ultrascale_plus/bsg_mem/bsg_mem_1rw_sync_mask_write_bit.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_mem/bsg_mem_1rw_sync_mask_write_byte.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_mem/bsg_mem_1rw_sync_mask_write_byte_synth.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_mem/bsg_mem_1rw_sync_synth.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_mem/bsg_mem_2r1w_sync.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_mem/bsg_mem_2r1w_sync_synth.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_noc/bsg_mesh_stitch.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_mux.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_mux_bitwise.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_mux_butterfly.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_mux_one_hot.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_mux_segmented.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_muxi2_gatestack.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_nand.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_nor3.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_dataflow/bsg_one_fifo.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_dataflow/bsg_parallel_in_serial_out.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_dataflow/bsg_parallel_in_serial_out_dynamic.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_priority_encode.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_priority_encode_one_hot_out.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_reduce.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_reduce_segmented.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_rotate_left.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_rotate_right.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_dataflow/bsg_round_robin_1_to_n.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_round_robin_arb.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_dataflow/bsg_round_robin_n_to_1.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_scan.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_dataflow/bsg_serial_in_parallel_out.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_dataflow/bsg_serial_in_parallel_out_dynamic.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_dataflow/bsg_serial_in_parallel_out_full.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_dataflow/bsg_shift_reg.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_strobe.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_swap.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_transpose.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_dataflow/bsg_two_fifo.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_unconcentrate_static.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_noc/bsg_wormhole_concentrator.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_noc/bsg_wormhole_concentrator_in.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_noc/bsg_wormhole_concentrator_out.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_noc/bsg_wormhole_router.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_noc/bsg_wormhole_router_adapter.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_noc/bsg_wormhole_router_adapter_in.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_noc/bsg_wormhole_router_adapter_out.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_noc/bsg_wormhole_router_decoder_dor.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_noc/bsg_wormhole_router_input_control.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_noc/bsg_wormhole_router_output_control.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_xnor.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj
