; Intel - x86-64

segment .data
    ; EAX
    SYS_READ  equ 0x3
    SYS_WRITE equ 0x4
    SYS_EXIT  equ 0x3c

    ;EBX
    STD_IN    equ 0x0
    STD_OUT   equ 0x1
    EXIT      equ 0x0

section .data
    SIZE_X    equ 0x2
    SIZE_Y    equ 0x2
    SIZE_SUM  equ 0x1

    X equ 1
    Y equ 2

section .bss
    x resb SIZE_X
    y resb SIZE_Y

section .text
    global _start

    _start:
        ;mov rax, SYS_READ
        ;mov rbx, STD_IN
        ;mov rcx, x
        ;mov rdx, SIZE_X
        ;syscall

        ;mov rax, SYS_READ
        ;mov rbx, STD_IN
        ;mov rcx, y
        ;mov rdx, SIZE_Y
        ;syscall

        ; x = x + y
        mov rax, X
        add rax, Y
        add rax, 0x30
        ;imul rax
        mov rcx, rax

        mov rax, SYS_WRITE
        mov rbx, STD_OUT
        ;mov rcx, X
        mov rdx, SIZE_SUM
        syscall

        mov rax, SYS_EXIT
        mov rbx, EXIT
        syscall
