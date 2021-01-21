/* Copyright (c) 2019, University of Washington
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of the University of Washington nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL UNIVERSITY OF WASHINGTON BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

*/

/*
 * This test checks if timer interrupts are working 
 */
#include <stdint.h>
//#include "bp_utils.h"
#define NUM_INTERRUPTS 8

uint8_t int_count = 48;
uint64_t *mtimecmp = 0x304000;
uint64_t *mtime = 0x30bff8;

//void pass() { while(1); }
//void fail() { while(1); }

void trap_success(void) __attribute__((interrupt));
void trap_success() {
    // Read mcause
    uint64_t mcause;
    __asm__ __volatile__ ("csrr %0, mcause" : "=r" (mcause));

    // Check for interrupt
    if ((mcause >> 63) == 1) {
      if(((mcause & 7) == 4) || ((mcause & 7) == 5) || ((mcause & 7) == 7))
        int_count++;
        // Sufficiently far in the future to have delayed interrupts
        // Writes to mtimecmp clears the interrupt
        *mtimecmp = *mtime + 1024;
        //bp_cprint(int_count);
        //bp_cprint(10);
        printf("%d\n", int_count);
        if((int_count - 48) == NUM_INTERRUPTS)
          pass();
    }
    else {
      //bp_cprint(int_count);
      //bp_cprint(10);
      fail();
    }
}

void main(uint64_t argc, char * argv[]) {
   uint64_t mie = (1 << 7) | (1 << 5) | (1 << 4); // M + S + U timer interrupt enable
   uint64_t mstatus = (1 << 3) | (1 << 1) | (1 << 0); // Global interrupt enable
   // Set up trap to alternate handler
   __asm__ __volatile__ ("csrw mtvec, %0": : "r" (&trap_success));
   // Setting up mtimecmp and mtime with some arbitrary values
   *mtimecmp = 64;
   *mtime = 0;
   // Enabling interrupts for User, Supervisor and Machine mode
   __asm__ __volatile__ ("csrw mie, %0": : "r" (mie));
   __asm__ __volatile__ ("csrw mstatus, %0" : : "r" (mstatus));
  
   while(1)
     __asm__ __volatile__ ("wfi");
}

