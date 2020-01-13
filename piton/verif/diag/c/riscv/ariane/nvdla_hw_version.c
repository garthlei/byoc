#include <stdio.h>
#include "../piton/verif/diag/c/riscv/ariane/nvdla_glb.h"
#include "../piton/verif/diag/c/riscv/ariane/nvdla.h"

// Test to access hardware version number on NVDLA
int main(int argc, char ** argv) {
  const REAL_HW_VERSION = 0x00010001;
  unsigned int HW_VERSION = *(BASE_ADDR + GLB_HW_VERSION);
  printf("Expected HW_VERSION %08x\n", REAL_HW_VERSION);
  printf("HW_VERSION %08x\n", HW_VERSION);
  printf("TEST %sED\n", HW_VERSION == REAL_HW_VERSION ? "PASS" : "FAIL");
  return 0;
}
