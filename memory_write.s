.text
.global main
main:
    ldr r0, =value1
    mov r1, #100
    str r1, [r0]
    
    ldr r1, =value1
    ldr r1, [r1] 
    ldr r0, =numberFormat
    bl printf

    mov r0, #0    
    mov r7, #1
    swi 0

.data
numberFormat:
    .asciz "%d\n"

value1:
    .word 0

