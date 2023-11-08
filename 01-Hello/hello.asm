; Intel - IA-32 (32bits) - compatível com x86-64 (64 bits)

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
    QUESTION     db "Qual seu nome? "   ; char QUESTION[] = "Qual seu nome?";
    SIZE_QUEST  equ $ - QUESTION        ; int SIZE_QUESTION = 14;
    HELLO        db "Olá, "             ; char HELLO[] = "Olá, ";
    SIZE_HELLO  equ $-HELLO             ; int SIZE_HELLO = 5;
    SIZE_NAME     equ 0xA               ; int SIZE_NAME = 10;

section .bss
    NAME resb SIZE_NAME                 ; char NAME[SIZE_NAME];

section .text
    global _start

_start:
    mov eax, SYS_WRITE                  ; printf("%s", &QUESTION);
    mov rbx, STD_OUT
    mov rcx, QUESTION
    mov rdx, SIZE_QUEST
    syscall

    mov rax, SYS_READ                   ; scanf(%s, &NAME);
    mov rbx, STD_IN
    mov rcx, NAME
    mov rdx, SIZE_NAME
    syscall

    mov rax, SYS_WRITE                  ; printf("%s", &HELLO);
    mov rbx, STD_OUT
    mov rcx, HELLO
    mov rdx, SIZE_HELLO
    syscall

    mov rax, SYS_WRITE                  ; printf("%s", &NAME);
    mov rbx, STD_OUT
    mov rcx, NAME
    mov rdx, SIZE_NAME
    syscall

    mov rax, SYS_EXIT                   ; return 0;
    mov rbx, EXIT
    syscall
