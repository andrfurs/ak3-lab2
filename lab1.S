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
	
	// (a-b)
	sub r0, r1
	// (a-b)*3
	mul r0, r3

	// Порівняння C з 0
	cmp r2, #0
	bgt greater
	blt lower

	b continue

// Якщо C > 0
greater:
	// Знаходження 2^C
	cmp r2, #1
	beq contg
	mul r4, r5
	sub r2, #1
	b greater
	contg:
		// (a-b)*3*2^C
		mul r0, r4
		b continue

// Якщо C < 0
lower:
	// Зміна знаку C на +
	mul r2, r6
	// Зсув (a-b)*3 вправо на С
	lsr r0, r2
	b continue

continue:
	pop {r0, r1, r2, r3, r4, r5, r6, lr}
	bx lr
