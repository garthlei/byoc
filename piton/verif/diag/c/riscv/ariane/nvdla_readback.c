#include <stdio.h>
#include "../piton/verif/diag/c/riscv/ariane/nvdla_glb.h"
#include "../piton/verif/diag/c/riscv/ariane/nvdla.h"

// updates NVDLA interrupt mask and checks that change is reflected
int main(int argc, char ** argv) {
  unsigned int old = *(BASE_ADDR + GLB_INTR_MASK);
  printf("INTR_MASK %08x\n", old);

  *(BASE_ADDR + GLB_INTR_MASK) += 1;

  unsigned int new = *(BASE_ADDR + GLB_INTR_MASK); 
  printf("INTR_MASK %08x\n", new);

  printf("TEST %sED\n", old + 1 == new ? "PASS" : "FAIL");
  return 0;
}
