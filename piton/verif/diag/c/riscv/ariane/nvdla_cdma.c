#include <stdio.h>
#include "../piton/verif/diag/c/riscv/ariane/nvdla_cdma.h"
#include "../piton/verif/diag/c/riscv/ariane/nvdla.h"

int main(int argc, char ** argv) {
  unsigned int data_addr = 0x10000000;

  

  *(base_addr + CDMA_DATAIN_SIZE_0) = 1;
  *(base_addr + CDMA_DATAIN_SIZE_1) = 1;
  *(base_addr + CDMA_DAIN_ADDR_HIGH_0) = 0;
  *(base_addr + CDMA_DAIN_ADDR_LOW_1) = data_addr;
  *(base_addr + CDMA_DAIN_ADDR_HIGH_0) = 0;
  *(base_addr + CDMA_DAIN_ADDR_LOW_1) = data_addr;

  *(base_addr + CDMA_WEIGHT_SIZE_0) = 1;
  *(base_addr + CDMA_WEIGHT_SIZE_1) = 1;
  *(base_addr + CDMA_WEIGHT_ADDR_HIGH) = 0;
  *(base_addr + CDMA_WEIGHT_ADDR_LOW) = data_addr;
  *(base_addr + CDMA_WEIGHT_BYTES) = 1;

  *(base_addr + CDMA_WGS_ADDR_HIGH) = 0;
  *(base_addr + CDMA_WGS_ADDR_LOW) = data_addr;
  *(base_addr + CDMA_WMB_ADDR_HIGH) = 0;
  *(base_addr + CDMA_WMB_ADDR_LOW) = data_addr;
  *(base_addr + CDMA_WMB_BYTES) = 1;

  *(base_addr + CDMA_CVT_CFG) = 0; // disable convertor
  *(base_addr + CDMA_PERF_ENABLE) = 0; // disable perf
  *(base_addr + CDMA_NAN_FLUSH_TO_ZERO) = 1; // replace NAN with 0


  *(base_addr + CDMA_OP_ENABLE) = 1;
  while (*(base_addr + CDMA_OP_ENABLE)); //wait for hardware to de-enable
  
  return 0;
}
