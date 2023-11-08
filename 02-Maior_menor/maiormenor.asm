; Intel - x86 (32bits) - compatível com x86 (64 bits)

segment .data
    ; EAX
    SYS_WRITE equ 0x4
    SYS_EXIT  equ 0x1

    ;EBX
    STD_OUT   equ 0x1
    EXIT      equ 0x0

    SYS_CALL  equ 0x80

section .data

    GREAT_MSG   db "X maior que Y", 0xa     ; char GREAT_MSG[] = "X maior que Y\n";
    EQUA_MSG    db "X iqual a Y", 0xa       ; char EQUA_MSG[]  = "X igual a Y\n";
    LESS_MSG    db "X menor que Y", 0xa     ; char LESS_MSG[]  = "X menor que Y,\n";

    SIZE_G      equ 14                      ; int SIZE_G = 14;
    SIZE_L      equ 14                      ; int SIZE_L = 14;
    SIZE_E      equ 12                      ; int SIZE_E = 12;
    X           dd   4                      ; int X      =  4;
    Y           dd   5                      ; int Y      =  5;

section .text
    global _start

    _start:

        mov eax, DWORD [X]
        mov ebx, DWORD [Y]
        cmp eax, ebx
        je  equa                            ; if (X == Y) equa();
        jg  great                           ; else if (X > Y) great();

        mov ecx, LESS_MSG
        mov edx, SIZE_L                     ; print(LESS_MSG, SIZE_L);
        call print
        jmp exit                            ; exit();

    equa:
        mov ecx, EQUA_MSG                   ; void equa()
        mov edx, SIZE_E                     ; {
        call print                          ;       print(EQUA_MSG, SIZE_E);
        jmp exit                            ;       return;
                                            ; }

    great:
        mov ecx, GREAT_MSG                  ; void great()
        mov edx, SIZE_G                     ; {
        call print                          ;       print(GREAT_MSG, SIZE_G);
        jmp exit                            ;       return;
                                            ; }

    exit:
        mov eax, SYS_EXIT
        mov ebx, EXIT                       ; exit(0);
        int SYS_CALL

    print:
        mov eax, SYS_WRITE                  ; void print(char[] msg, int size)
        mov ebx, STD_OUT                    ; {
        int SYS_CALL                        ;       printf("%s", &msg);
        ret                                 ;       return;
                                            ; }
