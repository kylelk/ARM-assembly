.global main

main:
    mov r0, #99

loop:
    push {r0}
    mov r1, r0
    mov r2, r0
    sub r3, r0, #1
    ldr r0, =lyric
    bl printf
    pop {r0}
    
    sub r0, r0, #1
    cmp r0, #0
    bgt loop

    ldr r0, =last_lyric
    bl printf

    mov r7, #1
    swi 0
    
lyric:
    .ascii "%d bottles of beer on the wall\n"
    .ascii "%d bottles of beer\n"
    .ascii "Take one down, pass it around\n"
    .ascii "%d bottles of beer on the wall\n\n\000"

last_lyric:
    .ascii "No more bottles of beer on the wall, no more bottles of beer.\n"
    .ascii "Go to the store and buy some more, 99 bottles of beer on the wall\n\000"
