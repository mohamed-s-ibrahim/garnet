#!/bin/bash
# ==============================================================================
# NIC400 design files (RTL)
# ==============================================================================
files=(
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/nic400/verilog/nic400_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/amib_apb_group_peripherals/verilog/nic400_amib_apb_group_peripherals_a_gen_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/amib_apb_group_peripherals/verilog/nic400_amib_apb_group_peripherals_apb_m_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/amib_apb_group_peripherals/verilog/nic400_amib_apb_group_peripherals_chan_slice_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/amib_apb_group_peripherals/verilog/nic400_amib_apb_group_peripherals_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/amib_master_CGRA_DATA/verilog/nic400_amib_master_CGRA_DATA_chan_slice_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/amib_master_CGRA_DATA/verilog/nic400_amib_master_CGRA_DATA_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/amib_master_CGRA_REG/verilog/nic400_amib_master_CGRA_REG_chan_slice_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/amib_master_CGRA_REG/verilog/nic400_amib_master_CGRA_REG_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/amib_master_SRAM0/verilog/nic400_amib_master_SRAM0_chan_slice_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/amib_master_SRAM0/verilog/nic400_amib_master_SRAM0_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/amib_master_SRAM1/verilog/nic400_amib_master_SRAM1_chan_slice_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/amib_master_SRAM1/verilog/nic400_amib_master_SRAM1_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/amib_master_SRAM2/verilog/nic400_amib_master_SRAM2_chan_slice_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/amib_master_SRAM2/verilog/nic400_amib_master_SRAM2_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/amib_master_SRAM3/verilog/nic400_amib_master_SRAM3_chan_slice_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/amib_master_SRAM3/verilog/nic400_amib_master_SRAM3_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/amib_master_SRAM4/verilog/nic400_amib_master_SRAM4_chan_slice_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/amib_master_SRAM4/verilog/nic400_amib_master_SRAM4_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/amib_master_SRAM5/verilog/nic400_amib_master_SRAM5_chan_slice_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/amib_master_SRAM5/verilog/nic400_amib_master_SRAM5_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/amib_master_TLX/verilog/nic400_amib_master_TLX_chan_slice_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/amib_master_TLX/verilog/nic400_amib_master_TLX_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/asib_slave_DMA0/verilog/nic400_asib_slave_DMA0_chan_slice_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/asib_slave_DMA0/verilog/nic400_asib_slave_DMA0_decode_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/asib_slave_DMA0/verilog/nic400_asib_slave_DMA0_maskcntl_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/asib_slave_DMA0/verilog/nic400_asib_slave_DMA0_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/asib_slave_DMA0/verilog/nic400_asib_slave_DMA0_rd_ss_cdas_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/asib_slave_DMA0/verilog/nic400_asib_slave_DMA0_wr_ss_cdas_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/asib_slave_DMA1/verilog/nic400_asib_slave_DMA1_chan_slice_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/asib_slave_DMA1/verilog/nic400_asib_slave_DMA1_decode_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/asib_slave_DMA1/verilog/nic400_asib_slave_DMA1_maskcntl_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/asib_slave_DMA1/verilog/nic400_asib_slave_DMA1_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/asib_slave_DMA1/verilog/nic400_asib_slave_DMA1_rd_ss_cdas_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/asib_slave_DMA1/verilog/nic400_asib_slave_DMA1_wr_ss_cdas_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/asib_slave_M3_DI/verilog/nic400_asib_slave_M3_DI_ahb_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/asib_slave_M3_DI/verilog/nic400_asib_slave_M3_DI_chan_slice_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/asib_slave_M3_DI/verilog/nic400_asib_slave_M3_DI_decode_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/asib_slave_M3_DI/verilog/nic400_asib_slave_M3_DI_itb_ss_cdas_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/asib_slave_M3_DI/verilog/nic400_asib_slave_M3_DI_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/asib_slave_M3_SYS/verilog/nic400_asib_slave_M3_SYS_ahb_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/asib_slave_M3_SYS/verilog/nic400_asib_slave_M3_SYS_chan_slice_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/asib_slave_M3_SYS/verilog/nic400_asib_slave_M3_SYS_decode_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/asib_slave_M3_SYS/verilog/nic400_asib_slave_M3_SYS_itb_ss_cdas_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/asib_slave_M3_SYS/verilog/nic400_asib_slave_M3_SYS_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm0/verilog/nic400_bm0_add_arb_ml0_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm0/verilog/nic400_bm0_add_arb_ml1_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm0/verilog/nic400_bm0_add_arb_ml2_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm0/verilog/nic400_bm0_add_arb_ml3_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm0/verilog/nic400_bm0_add_arb_ml5_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm0/verilog/nic400_bm0_add_arb_ml6_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm0/verilog/nic400_bm0_add_sel_ml0_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm0/verilog/nic400_bm0_add_sel_ml1_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm0/verilog/nic400_bm0_add_sel_ml2_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm0/verilog/nic400_bm0_add_sel_ml3_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm0/verilog/nic400_bm0_add_sel_ml4_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm0/verilog/nic400_bm0_add_sel_ml5_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm0/verilog/nic400_bm0_add_sel_ml6_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm0/verilog/nic400_bm0_lrg_arb_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm0/verilog/nic400_bm0_maskcntl_ml0_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm0/verilog/nic400_bm0_maskcntl_ml1_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm0/verilog/nic400_bm0_maskcntl_ml2_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm0/verilog/nic400_bm0_maskcntl_ml3_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm0/verilog/nic400_bm0_maskcntl_ml4_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm0/verilog/nic400_bm0_maskcntl_ml5_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm0/verilog/nic400_bm0_maskcntl_ml6_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm0/verilog/nic400_bm0_ml_blayer_0_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm0/verilog/nic400_bm0_ml_blayer_1_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm0/verilog/nic400_bm0_ml_blayer_2_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm0/verilog/nic400_bm0_ml_blayer_3_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm0/verilog/nic400_bm0_ml_build_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm0/verilog/nic400_bm0_ml_map_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm0/verilog/nic400_bm0_ml_mlayer_0_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm0/verilog/nic400_bm0_ml_mlayer_1_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm0/verilog/nic400_bm0_ml_mlayer_2_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm0/verilog/nic400_bm0_ml_mlayer_3_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm0/verilog/nic400_bm0_ml_mlayer_4_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm0/verilog/nic400_bm0_ml_mlayer_5_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm0/verilog/nic400_bm0_ml_mlayer_6_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm0/verilog/nic400_bm0_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm0/verilog/nic400_bm0_qv_cmp_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm0/verilog/nic400_bm0_rd_ss_tt_s0_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm0/verilog/nic400_bm0_rd_ss_tt_s1_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm0/verilog/nic400_bm0_rd_st_tt_s2_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm0/verilog/nic400_bm0_rd_st_tt_s3_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm0/verilog/nic400_bm0_ret_sel_ml0_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm0/verilog/nic400_bm0_ret_sel_ml1_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm0/verilog/nic400_bm0_ret_sel_ml2_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm0/verilog/nic400_bm0_ret_sel_ml3_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm0/verilog/nic400_bm0_ret_sel_ml4_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm0/verilog/nic400_bm0_ret_sel_ml5_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm0/verilog/nic400_bm0_ret_sel_ml6_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm0/verilog/nic400_bm0_wr_sel_ml0_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm0/verilog/nic400_bm0_wr_sel_ml1_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm0/verilog/nic400_bm0_wr_sel_ml2_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm0/verilog/nic400_bm0_wr_sel_ml3_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm0/verilog/nic400_bm0_wr_sel_ml4_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm0/verilog/nic400_bm0_wr_sel_ml5_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm0/verilog/nic400_bm0_wr_sel_ml6_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm0/verilog/nic400_bm0_wr_ss_tt_s0_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm0/verilog/nic400_bm0_wr_ss_tt_s1_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm0/verilog/nic400_bm0_wr_st_tt_s2_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm0/verilog/nic400_bm0_wr_st_tt_s3_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm1/verilog/nic400_bm1_add_sel_ml0_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm1/verilog/nic400_bm1_add_sel_ml1_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm1/verilog/nic400_bm1_add_sel_ml2_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm1/verilog/nic400_bm1_add_sel_ml3_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm1/verilog/nic400_bm1_add_sel_ml4_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm1/verilog/nic400_bm1_maskcntl_ml0_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm1/verilog/nic400_bm1_maskcntl_ml1_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm1/verilog/nic400_bm1_maskcntl_ml2_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm1/verilog/nic400_bm1_maskcntl_ml3_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm1/verilog/nic400_bm1_maskcntl_ml4_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm1/verilog/nic400_bm1_ml_blayer_0_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm1/verilog/nic400_bm1_ml_build_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm1/verilog/nic400_bm1_ml_map_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm1/verilog/nic400_bm1_ml_mlayer_0_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm1/verilog/nic400_bm1_ml_mlayer_1_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm1/verilog/nic400_bm1_ml_mlayer_2_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm1/verilog/nic400_bm1_ml_mlayer_3_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm1/verilog/nic400_bm1_ml_mlayer_4_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm1/verilog/nic400_bm1_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm1/verilog/nic400_bm1_rd_spi_tt_s0_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm1/verilog/nic400_bm1_rd_wr_arb_2_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm1/verilog/nic400_bm1_rd_wr_arb_3_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm1/verilog/nic400_bm1_ret_sel_ml0_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm1/verilog/nic400_bm1_ret_sel_ml1_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm1/verilog/nic400_bm1_ret_sel_ml2_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm1/verilog/nic400_bm1_ret_sel_ml3_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm1/verilog/nic400_bm1_ret_sel_ml4_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm1/verilog/nic400_bm1_wr_sel_ml0_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm1/verilog/nic400_bm1_wr_sel_ml1_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm1/verilog/nic400_bm1_wr_sel_ml2_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm1/verilog/nic400_bm1_wr_sel_ml3_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm1/verilog/nic400_bm1_wr_sel_ml4_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/busmatrix_bm1/verilog/nic400_bm1_wr_spi_tt_s0_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/cdc_blocks/verilog/nic400_cdc_bypass_sync_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/cdc_blocks/verilog/nic400_cdc_capt_nosync_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/cdc_blocks/verilog/nic400_cdc_capt_sync_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/cdc_blocks/verilog/nic400_cdc_comb_and2_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/cdc_blocks/verilog/nic400_cdc_comb_mux2_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/cdc_blocks/verilog/nic400_cdc_comb_or2_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/cdc_blocks/verilog/nic400_cdc_comb_or3_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/cdc_blocks/verilog/nic400_cdc_corrupt_gry_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/cdc_blocks/verilog/nic400_cdc_launch_gry_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/cdc_blocks/verilog/nic400_cdc_random_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/default_slave_ds_2/verilog/nic400_default_slave_ds_2_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_apb_group_peripherals_ib/verilog/nic400_ib_apb_group_peripherals_ib_axi_to_itb_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_apb_group_peripherals_ib/verilog/nic400_ib_apb_group_peripherals_ib_chan_slice_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_apb_group_peripherals_ib/verilog/nic400_ib_apb_group_peripherals_ib_downsize_itb_addr_fmt_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_apb_group_peripherals_ib/verilog/nic400_ib_apb_group_peripherals_ib_downsize_rd_cam_slice_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_apb_group_peripherals_ib/verilog/nic400_ib_apb_group_peripherals_ib_downsize_rd_chan_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_apb_group_peripherals_ib/verilog/nic400_ib_apb_group_peripherals_ib_downsize_rd_cntrl_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_apb_group_peripherals_ib/verilog/nic400_ib_apb_group_peripherals_ib_downsize_resp_cam_slice_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_apb_group_peripherals_ib/verilog/nic400_ib_apb_group_peripherals_ib_downsize_wr_cntrl_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_apb_group_peripherals_ib/verilog/nic400_ib_apb_group_peripherals_ib_downsize_wr_merge_buffer_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_apb_group_peripherals_ib/verilog/nic400_ib_apb_group_peripherals_ib_downsize_wr_mux_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_apb_group_peripherals_ib/verilog/nic400_ib_apb_group_peripherals_ib_downsize_wr_resp_block_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_apb_group_peripherals_ib/verilog/nic400_ib_apb_group_peripherals_ib_itb_to_axi_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_apb_group_peripherals_ib/verilog/nic400_ib_apb_group_peripherals_ib_master_domain_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_apb_group_peripherals_ib/verilog/nic400_ib_apb_group_peripherals_ib_slave_domain_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_CGRA_DATA_ib/verilog/nic400_ib_master_CGRA_DATA_ib_ar_fifo_rd_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_CGRA_DATA_ib/verilog/nic400_ib_master_CGRA_DATA_ib_ar_fifo_sync_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_CGRA_DATA_ib/verilog/nic400_ib_master_CGRA_DATA_ib_ar_fifo_wr_mux2_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_CGRA_DATA_ib/verilog/nic400_ib_master_CGRA_DATA_ib_ar_fifo_wr_mux_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_CGRA_DATA_ib/verilog/nic400_ib_master_CGRA_DATA_ib_ar_fifo_wr_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_CGRA_DATA_ib/verilog/nic400_ib_master_CGRA_DATA_ib_aw_fifo_rd_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_CGRA_DATA_ib/verilog/nic400_ib_master_CGRA_DATA_ib_aw_fifo_sync_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_CGRA_DATA_ib/verilog/nic400_ib_master_CGRA_DATA_ib_aw_fifo_wr_mux2_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_CGRA_DATA_ib/verilog/nic400_ib_master_CGRA_DATA_ib_aw_fifo_wr_mux_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_CGRA_DATA_ib/verilog/nic400_ib_master_CGRA_DATA_ib_aw_fifo_wr_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_CGRA_DATA_ib/verilog/nic400_ib_master_CGRA_DATA_ib_b_fifo_rd_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_CGRA_DATA_ib/verilog/nic400_ib_master_CGRA_DATA_ib_b_fifo_sync_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_CGRA_DATA_ib/verilog/nic400_ib_master_CGRA_DATA_ib_b_fifo_wr_mux2_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_CGRA_DATA_ib/verilog/nic400_ib_master_CGRA_DATA_ib_b_fifo_wr_mux_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_CGRA_DATA_ib/verilog/nic400_ib_master_CGRA_DATA_ib_b_fifo_wr_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_CGRA_DATA_ib/verilog/nic400_ib_master_CGRA_DATA_ib_cdc_air_corrupt_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_CGRA_DATA_ib/verilog/nic400_ib_master_CGRA_DATA_ib_chan_slice_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_CGRA_DATA_ib/verilog/nic400_ib_master_CGRA_DATA_ib_maskcntl_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_CGRA_DATA_ib/verilog/nic400_ib_master_CGRA_DATA_ib_master_domain_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_CGRA_DATA_ib/verilog/nic400_ib_master_CGRA_DATA_ib_r_fifo_rd_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_CGRA_DATA_ib/verilog/nic400_ib_master_CGRA_DATA_ib_r_fifo_sync_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_CGRA_DATA_ib/verilog/nic400_ib_master_CGRA_DATA_ib_r_fifo_wr_mux2_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_CGRA_DATA_ib/verilog/nic400_ib_master_CGRA_DATA_ib_r_fifo_wr_mux_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_CGRA_DATA_ib/verilog/nic400_ib_master_CGRA_DATA_ib_r_fifo_wr_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_CGRA_DATA_ib/verilog/nic400_ib_master_CGRA_DATA_ib_slave_domain_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_CGRA_DATA_ib/verilog/nic400_ib_master_CGRA_DATA_ib_w_fifo_rd_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_CGRA_DATA_ib/verilog/nic400_ib_master_CGRA_DATA_ib_w_fifo_sync_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_CGRA_DATA_ib/verilog/nic400_ib_master_CGRA_DATA_ib_w_fifo_wr_mux2_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_CGRA_DATA_ib/verilog/nic400_ib_master_CGRA_DATA_ib_w_fifo_wr_mux_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_CGRA_DATA_ib/verilog/nic400_ib_master_CGRA_DATA_ib_w_fifo_wr_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_CGRA_REG_ib/verilog/nic400_ib_master_CGRA_REG_ib_ar_fifo_rd_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_CGRA_REG_ib/verilog/nic400_ib_master_CGRA_REG_ib_ar_fifo_sync_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_CGRA_REG_ib/verilog/nic400_ib_master_CGRA_REG_ib_ar_fifo_wr_mux2_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_CGRA_REG_ib/verilog/nic400_ib_master_CGRA_REG_ib_ar_fifo_wr_mux_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_CGRA_REG_ib/verilog/nic400_ib_master_CGRA_REG_ib_ar_fifo_wr_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_CGRA_REG_ib/verilog/nic400_ib_master_CGRA_REG_ib_aw_fifo_rd_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_CGRA_REG_ib/verilog/nic400_ib_master_CGRA_REG_ib_aw_fifo_sync_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_CGRA_REG_ib/verilog/nic400_ib_master_CGRA_REG_ib_aw_fifo_wr_mux2_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_CGRA_REG_ib/verilog/nic400_ib_master_CGRA_REG_ib_aw_fifo_wr_mux_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_CGRA_REG_ib/verilog/nic400_ib_master_CGRA_REG_ib_aw_fifo_wr_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_CGRA_REG_ib/verilog/nic400_ib_master_CGRA_REG_ib_b_fifo_rd_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_CGRA_REG_ib/verilog/nic400_ib_master_CGRA_REG_ib_b_fifo_sync_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_CGRA_REG_ib/verilog/nic400_ib_master_CGRA_REG_ib_b_fifo_wr_mux2_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_CGRA_REG_ib/verilog/nic400_ib_master_CGRA_REG_ib_b_fifo_wr_mux_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_CGRA_REG_ib/verilog/nic400_ib_master_CGRA_REG_ib_b_fifo_wr_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_CGRA_REG_ib/verilog/nic400_ib_master_CGRA_REG_ib_cdc_air_corrupt_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_CGRA_REG_ib/verilog/nic400_ib_master_CGRA_REG_ib_chan_slice_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_CGRA_REG_ib/verilog/nic400_ib_master_CGRA_REG_ib_downsize_rd_addr_fmt_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_CGRA_REG_ib/verilog/nic400_ib_master_CGRA_REG_ib_downsize_rd_cam_slice_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_CGRA_REG_ib/verilog/nic400_ib_master_CGRA_REG_ib_downsize_rd_chan_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_CGRA_REG_ib/verilog/nic400_ib_master_CGRA_REG_ib_downsize_rd_cntrl_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_CGRA_REG_ib/verilog/nic400_ib_master_CGRA_REG_ib_downsize_resp_cam_slice_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_CGRA_REG_ib/verilog/nic400_ib_master_CGRA_REG_ib_downsize_wr_addr_fmt_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_CGRA_REG_ib/verilog/nic400_ib_master_CGRA_REG_ib_downsize_wr_cntrl_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_CGRA_REG_ib/verilog/nic400_ib_master_CGRA_REG_ib_downsize_wr_merge_buffer_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_CGRA_REG_ib/verilog/nic400_ib_master_CGRA_REG_ib_downsize_wr_mux_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_CGRA_REG_ib/verilog/nic400_ib_master_CGRA_REG_ib_downsize_wr_resp_block_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_CGRA_REG_ib/verilog/nic400_ib_master_CGRA_REG_ib_maskcntl_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_CGRA_REG_ib/verilog/nic400_ib_master_CGRA_REG_ib_master_domain_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_CGRA_REG_ib/verilog/nic400_ib_master_CGRA_REG_ib_r_fifo_rd_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_CGRA_REG_ib/verilog/nic400_ib_master_CGRA_REG_ib_r_fifo_sync_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_CGRA_REG_ib/verilog/nic400_ib_master_CGRA_REG_ib_r_fifo_wr_mux2_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_CGRA_REG_ib/verilog/nic400_ib_master_CGRA_REG_ib_r_fifo_wr_mux_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_CGRA_REG_ib/verilog/nic400_ib_master_CGRA_REG_ib_r_fifo_wr_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_CGRA_REG_ib/verilog/nic400_ib_master_CGRA_REG_ib_slave_domain_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_CGRA_REG_ib/verilog/nic400_ib_master_CGRA_REG_ib_w_fifo_rd_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_CGRA_REG_ib/verilog/nic400_ib_master_CGRA_REG_ib_w_fifo_sync_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_CGRA_REG_ib/verilog/nic400_ib_master_CGRA_REG_ib_w_fifo_wr_mux2_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_CGRA_REG_ib/verilog/nic400_ib_master_CGRA_REG_ib_w_fifo_wr_mux_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_CGRA_REG_ib/verilog/nic400_ib_master_CGRA_REG_ib_w_fifo_wr_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_TLX_ib/verilog/nic400_ib_master_TLX_ib_ar_fifo_rd_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_TLX_ib/verilog/nic400_ib_master_TLX_ib_ar_fifo_sync_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_TLX_ib/verilog/nic400_ib_master_TLX_ib_ar_fifo_wr_mux2_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_TLX_ib/verilog/nic400_ib_master_TLX_ib_ar_fifo_wr_mux_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_TLX_ib/verilog/nic400_ib_master_TLX_ib_ar_fifo_wr_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_TLX_ib/verilog/nic400_ib_master_TLX_ib_aw_fifo_rd_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_TLX_ib/verilog/nic400_ib_master_TLX_ib_aw_fifo_sync_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_TLX_ib/verilog/nic400_ib_master_TLX_ib_aw_fifo_wr_mux2_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_TLX_ib/verilog/nic400_ib_master_TLX_ib_aw_fifo_wr_mux_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_TLX_ib/verilog/nic400_ib_master_TLX_ib_aw_fifo_wr_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_TLX_ib/verilog/nic400_ib_master_TLX_ib_b_fifo_rd_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_TLX_ib/verilog/nic400_ib_master_TLX_ib_b_fifo_sync_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_TLX_ib/verilog/nic400_ib_master_TLX_ib_b_fifo_wr_mux2_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_TLX_ib/verilog/nic400_ib_master_TLX_ib_b_fifo_wr_mux_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_TLX_ib/verilog/nic400_ib_master_TLX_ib_b_fifo_wr_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_TLX_ib/verilog/nic400_ib_master_TLX_ib_cdc_air_corrupt_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_TLX_ib/verilog/nic400_ib_master_TLX_ib_chan_slice_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_TLX_ib/verilog/nic400_ib_master_TLX_ib_maskcntl_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_TLX_ib/verilog/nic400_ib_master_TLX_ib_master_domain_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_TLX_ib/verilog/nic400_ib_master_TLX_ib_r_fifo_rd_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_TLX_ib/verilog/nic400_ib_master_TLX_ib_r_fifo_sync_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_TLX_ib/verilog/nic400_ib_master_TLX_ib_r_fifo_wr_mux2_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_TLX_ib/verilog/nic400_ib_master_TLX_ib_r_fifo_wr_mux_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_TLX_ib/verilog/nic400_ib_master_TLX_ib_r_fifo_wr_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_TLX_ib/verilog/nic400_ib_master_TLX_ib_slave_domain_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_TLX_ib/verilog/nic400_ib_master_TLX_ib_w_fifo_rd_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_TLX_ib/verilog/nic400_ib_master_TLX_ib_w_fifo_sync_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_TLX_ib/verilog/nic400_ib_master_TLX_ib_w_fifo_wr_mux2_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_TLX_ib/verilog/nic400_ib_master_TLX_ib_w_fifo_wr_mux_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_master_TLX_ib/verilog/nic400_ib_master_TLX_ib_w_fifo_wr_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_slave_M3_DI_ib/verilog/nic400_ib_slave_M3_DI_ib_chan_slice_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_slave_M3_DI_ib/verilog/nic400_ib_slave_M3_DI_ib_itb_to_axi_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_slave_M3_DI_ib/verilog/nic400_ib_slave_M3_DI_ib_maskcntl_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_slave_M3_DI_ib/verilog/nic400_ib_slave_M3_DI_ib_master_domain_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_slave_M3_DI_ib/verilog/nic400_ib_slave_M3_DI_ib_slave_domain_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_slave_M3_DI_ib/verilog/nic400_ib_slave_M3_DI_ib_upsize_itb_addr_fmt_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_slave_M3_DI_ib/verilog/nic400_ib_slave_M3_DI_ib_upsize_rd_cam_slice_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_slave_M3_DI_ib/verilog/nic400_ib_slave_M3_DI_ib_upsize_rd_chan_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_slave_M3_DI_ib/verilog/nic400_ib_slave_M3_DI_ib_upsize_resp_cam_slice_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_slave_M3_DI_ib/verilog/nic400_ib_slave_M3_DI_ib_upsize_wr_cntrl_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_slave_M3_DI_ib/verilog/nic400_ib_slave_M3_DI_ib_upsize_wr_merge_buffer_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_slave_M3_DI_ib/verilog/nic400_ib_slave_M3_DI_ib_upsize_wr_resp_block_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_slave_M3_SYS_ib/verilog/nic400_ib_slave_M3_SYS_ib_chan_slice_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_slave_M3_SYS_ib/verilog/nic400_ib_slave_M3_SYS_ib_itb_to_axi_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_slave_M3_SYS_ib/verilog/nic400_ib_slave_M3_SYS_ib_maskcntl_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_slave_M3_SYS_ib/verilog/nic400_ib_slave_M3_SYS_ib_master_domain_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_slave_M3_SYS_ib/verilog/nic400_ib_slave_M3_SYS_ib_slave_domain_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_slave_M3_SYS_ib/verilog/nic400_ib_slave_M3_SYS_ib_upsize_itb_addr_fmt_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_slave_M3_SYS_ib/verilog/nic400_ib_slave_M3_SYS_ib_upsize_rd_cam_slice_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_slave_M3_SYS_ib/verilog/nic400_ib_slave_M3_SYS_ib_upsize_rd_chan_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_slave_M3_SYS_ib/verilog/nic400_ib_slave_M3_SYS_ib_upsize_resp_cam_slice_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_slave_M3_SYS_ib/verilog/nic400_ib_slave_M3_SYS_ib_upsize_wr_cntrl_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_slave_M3_SYS_ib/verilog/nic400_ib_slave_M3_SYS_ib_upsize_wr_merge_buffer_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/ib_slave_M3_SYS_ib/verilog/nic400_ib_slave_M3_SYS_ib_upsize_wr_resp_block_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/nic400/verilog/nic400_cd_cgra_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/nic400/verilog/nic400_cd_main_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/nic400/verilog/nic400_cd_tlx_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/reg_slice/verilog/nic400_ax4_reg_slice_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/reg_slice/verilog/nic400_buf_reg_slice_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/reg_slice/verilog/nic400_ful_regd_slice_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/reg_slice/verilog/nic400_fwd_regd_slice_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/reg_slice/verilog/nic400_rd_reg_slice_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/reg_slice/verilog/nic400_reg_slice_axi_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/reg_slice/verilog/nic400_rev_regd_slice_nic.v
  aha-arm-soc-june-2019/components/nic450/logical/nic400_nic/reg_slice/verilog/nic400_wr_reg_slice_nic.v
)

cat $files >> nic.v
