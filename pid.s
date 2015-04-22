.text
.global main
main:
    mov r7, #20   @ sys_getpid
    swi 0
    mov r1, r0
    ldr r0, =decimalFormat
    bl printf

    mov r0, #0
    mov r7, #1
    swi 0

.data
decimalFormat:
    .asciz "%d\n"

