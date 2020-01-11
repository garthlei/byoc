#include <stdio.h>
#include "../piton/verif/diag/c/riscv/ariane/nvdla_glb.h"
#include "../piton/verif/diag/c/riscv/ariane/nvdla.h"

int main(int argc, char ** argv) {
  
  printf("INTR_MASK %08x\n", *(base_addr + GLB_INTR_MASK));
  *(base_addr + GLB_INTR_MASK) += 1; 
  printf("INTR_MASK %08x\n", *(base_addr + GLB_INTR_MASK));
  return 0;
}
