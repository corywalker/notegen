MOV r3, #0xd3
MSR CPSR_c, r3
MOV r3, #0
MOV r2, #0x3c800000
MOV r1, #0xa5
STR r1, [r2]
LDR pc, [pc, #-4]
CMPMI r1, r1, asr #2
