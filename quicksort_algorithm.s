    .section .text
    .global _start

_start:
    ldr r4, =array
    ldr r5, =array_size
    ldr r5, [r5]
    sub r5, r5, #1
    bl quicksort

    mov r7, #1
    swi 0

quicksort:
    push {r4-r6, lr}
    cmp r1, r2
    movge r0, #0
    popge {r4-r6, pc}

    mov r0, r4
    mov r1, r1
    mov r2, r2
    bl partition
    mov r3, r0

    mov r0, r4
    mov r1, r1
    sub r2, r3, #1
    bl quicksort

    mov r0, r4
    add r1, r3, #1
    mov r2, r2
    bl quicksort

    pop {r4-r6, pc}

partition:
    push {r4-r8, lr}
    mov r6, r1
    mov r7, r2
    add r3, r0, r7, lsl #2
    ldr r3, [r3]
    sub r4, r6, #1
    mov r5, r6
for_loop:
    cmp r5, r7
    addgt r5, r5, #1
    bgt end_for

    add r8, r0, r5, lsl #2
    ldr r8, [r8]
    cmp r8, r3
    bge else_block

    add r4, r4, #1
    add r8, r0, r4, lsl #2
    ldr r8, [r8]
    add lr, r0, r5, lsl #2
    ldr lr, [lr]
    add r9, r0, r4, lsl #2
    str lr, [r9]
    add r9, r0, r5, lsl #2
    str r8, [r9]

else_block:
    add r5, r5, #1
    b for_loop
end_for:
    add r4, r4, #1
    add r8, r0, r4, lsl #2
    ldr r8, [r8]
    add lr, r0, r7, lsl #2
    ldr lr, [lr]
    add r9, r0, r4, lsl #2
    str lr, [r9]
    add r9, r0, r7, lsl #2
    str r8, [r9]

    mov r0, r4
    pop {r4-r8, pc}

    .section .data
array:
    .word 3, 6, 8, 10, 1, 2, 1
array_size:
    .word 7
