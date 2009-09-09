
freeze.bin:     file format binary

Disassembly of section .data:

00000000 <.data>:
   0:	e3a030d3 	mov	r3, #211	; 0xd3
   4:	e121f003 	msr	CPSR_c, r3
   8:	e3a03000 	mov	r3, #0	; 0x0
   c:	e3a025f2 	mov	r2, #1015021568	; 0x3c800000
  10:	e3a010a5 	mov	r1, #165	; 0xa5
  14:	e5821000 	str	r1, [r2]
  18:	e2511001 	subs	r1, r1, #1	; 0x1
  1c:	eafffffd 	b	0x18
