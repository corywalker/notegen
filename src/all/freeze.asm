MOV r3, #0xd3
MSR CPSR_c, r3
MOV r3, #0
MOV r2, #0x3c800000
MOV r1, #0xa5
STR r1, [r2]
SUBS r1, r1, #1
B 0x18
