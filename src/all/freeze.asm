MOV r3, #0xd3
MSR CPSR_c, r3            @ Supervisor mode, no IRQs, no FIQs
MOV r3, #0
MOV r2, #0x3c800000
MOV r1, #0xa5
STR r1, [r2]              @ Shoot watchdog
SUBS r1, r1, #1
B 0x18
