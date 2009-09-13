MOV R3, #0xD3
MSR CPSR_c, R3            @ Supervisor mode, no IRQs, no FIQs
MOV R3, #0
MOV R2, #0x3C800000
MOV R1, #0xA5
STR R1, [R2]              @ Shoot watchdog
MOV R1, #0x39C00000
STR R3, [R1,#0x08]        @ Mask all internal interrupts
STR R3, [R1,#0x20]        @ Mask all external interrupts
SUB R2, R3, #1
STR R2, [R1]              @ Ack all internal interrupts
STR R2, [R1,#0x10]        @ Ack the arbiter output
STR R2, [R1,#0x1c]        @ Ack all external interrupts

LDR R1, =0x3c500028       @ Enable all clocks
STR R3, [R1]
LDR R1, =0x3c500040
STR R3, [R1]

LDR R1, =0x3cc00000
MOV R2, #0x00000003
STR R2, [R1]
MOV R2, #0x00000400
ADD R2, R2, #0x00000005
STR R2, [R1,#0x04]
MOV R2, #0x00000007
STR R2, [R1,#0x08]
MOV R2, #0
STR R2, [R1,#0x0c]
MOV R2, #0x00000026
STR R2, [R1,#0x28]

MOV R4, #0
MOV R2, #0x20000000
MOV R3, #0x0000C800
BL  dump
MOV R2, #0x22000000
MOV R3, #0x00040000
BL  dump
MOV R2, #0x24000000
MOV R3, #0x00100000
BL  dump
MOV R2, #0x08000000
MOV R3, #0x02000000
BL  dump
wait1:
LDR R5, [R1,#0x18]
TST R5, #0x200
BNE wait1
STR R4, [R1,#0x20]
hang:
MOV R1, R1
B hang

dump:
wait2:
LDR R5, [R1,#0x18]
TST R5, #0x200
BNE wait2
LDRB R5, [R2]
STR R5, [R1,#0x20]
ADD R4, R4, R5
ADD R2, R2, #1
SUBS R3, R3, #1
BNE dump
BX LR
