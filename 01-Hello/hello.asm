section .data
    SYS_WRITE equ 1
    SYS_READ  equ 0
    STDOUT    equ 1
    STDIN     equ 0
    SYS_EXIT  equ 60
    EXIT      equ 0

    QUESTION     db "Qual seu nome? "
    SIZE_QUEST  equ $-QUESTION
    HELLO        db "Olá, "
    SIZE_HELLO  equ $-HELLO
    SIZE_NAME     equ 10

section .bss
    NAME resb SIZE_NAME

section .text
    global _start

_start:
    mov rax, SYS_WRITE
    mov rdi, STDOUT
    mov rsi, QUESTION
    mov rdx, SIZE_QUEST
    syscall

    mov rax, SYS_READ
    mov rdi, STDIN
    mov rsi, NAME
    mov rdx, SIZE_NAME
    syscall

    mov rax, SYS_WRITE
    mov rdi, STDOUT
    mov rsi, HELLO
    mov rdx, SIZE_HELLO
    syscall

    mov rax, SYS_WRITE
    mov rdi, STDOUT
    mov rsi, NAME
    mov rdx, SIZE_NAME
    syscall


    mov rax, SYS_EXIT
    mov rdi, EXIT
    syscall
