.global lab1
.syntax unified
#define A #11
#define B #4
#define C #3
lab1:
	push {lr}
	// calculate
	mov r0, A
	mov r1, B
	mov r2, C
	mov r3, #3
	mov r4, #2
	mov r5, #2
	mov r6, #-1
	bl calculate
	pop {pc}

calculate:
	push {r0, r1, r2, r3, r4, r5, r6, lr}

	sub r0, r1
	mul r0, r3

	cmp r2, #0
	bgt greater
	blt lower

	b continue

greater:
	cmp r2, #1
	beq contg
	mul r4, r5
	sub r2, #1
	b greater
	contg:
		mul r0, r4
		b continue

lower:
	mul r2, r6
	lsr r0, r2
	b continue

continue:
	pop {r0, r1, r2, r3, r4, r5, r6, lr}
	bx lr
