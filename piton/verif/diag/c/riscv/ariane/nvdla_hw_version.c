#include <stdio.h>
#include "../piton/verif/diag/c/riscv/ariane/nvdla_glb.h"
#include "../piton/verif/diag/c/riscv/ariane/nvdla.h"

int main(int argc, char ** argv) {
  printf("HW_VERSION %08x\n", *(base_addr + GLB_HW_VERSION));
  
  return 0;
}
