; Intel - x86 (32bits) - compatível com x86 (64 bits)

segment .data
    ; EAX
    SYS_READ  equ 0x3
    SYS_WRITE equ 0x4
    SYS_EXIT  equ 0x1

    ;EBX
    STD_IN    equ 0x0
    STD_OUT   equ 0x1
    EXIT      equ 0x0

    SYS_CALL  equ 0x80

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
    mov ebx, STD_OUT
    mov ecx, QUESTION
    mov edx, SIZE_QUEST
    int SYS_CALL

    mov eax, SYS_READ                   ; scanf(%s, &NAME);
    mov ebx, STD_IN
    mov ecx, NAME
    mov edx, SIZE_NAME
    int SYS_CALL

    mov eax, SYS_WRITE                  ; printf("%s", &HELLO);
    mov ebx, STD_OUT
    mov ecx, HELLO
    mov edx, SIZE_HELLO
    int SYS_CALL

    mov eax, SYS_WRITE                  ; printf("%s", &NAME);
    mov ebx, STD_OUT
    mov ecx, NAME
    mov edx, SIZE_NAME
    int SYS_CALL

    mov eax, SYS_EXIT                   ; return 0;
    mov ebx, EXIT
    int SYS_CALL
