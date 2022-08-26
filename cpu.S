#define CPU_OFST_REG	0
#define CPU_OFST_PC	0x80

.bss
.balign 4
.globl cpu_struct
cpu_struct:
	/* uint32_t regs[32] */
	.skip 32 * 4
	/* uint32_t pc */
	.skip 4
cpu_struct_end:

.text

.globl cpu_get_reg
cpu_get_reg:
	ldr r1, =cpu_struct
	mov r2, #4
	mul r3, r0, r2
	ldr r0, [r1, r3]
	bx lr

.globl cpu_set_reg
cpu_set_reg:
	ldr r2, =cpu_struct
	mov r3, #4
	mul r4, r0, r3
	str r1, [r2, r4]
	bx lr

.globl cpu_init
cpu_init:
	/* clear cpu struct */
	ldr r0, =cpu_struct
	ldr r1, =cpu_struct_end
	sub r2, r1, r0
	movs r1, #0
	bl memset

