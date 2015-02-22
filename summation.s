.global main

print_num:
    .asciz "%d\n"
    .align 4

main:
    mov r0, #100
    bl sum
    
    mov r1, r0
    ldr r0, =print_num
    bl printf

    mov r7, #1
    swi 0

# sum = (n*(n+1))/2
sum:
    push {r1}
    mov r1, r0          @ temp = n
    add r1, r1, #1      @ temp = temp+1
    mul r0, r0, r1      @ n = n * temp
    lsr r0, #1          @ n = n/2
    pop {r1}
    bx lr    
