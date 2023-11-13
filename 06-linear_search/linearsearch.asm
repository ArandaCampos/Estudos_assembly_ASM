; x86 (Intel/ AMD - 32/64 bits)

section .rdata
    SYS_EXIT    equ 0x1
    SYS_CALL    equ 0x80
    EXIT        equ 0x0

    LIST        db 0xA, 0xF, 0x11, 0x14     ; [10, 15, 17, 20]
    SIZE        equ $-LIST

section .text

global _start

linearsearch:               ; EAX = &lista, EBX = Número buscado, ECX = SIZE
    cmp ecx, 0x0            ; se lista vazia:
        je .notfound        ;       retorna 0;
    mov esi, eax            ;
    xor eax, eax            ; contador (eax) = 0
.next:                      ; enquanto (SIZE > 0){
    movzx edx, byte[esi]    ;       edx = lista[0];
    cmp edx, ebx            ;       if (edx == N )
        je .found           ;           returna contador;
    inc esi                 ;       lista = lista[1];
    inc eax                 ;       contador++;
    loop .next              ;       }
                            ; }

.found:
    ret

.notfound:
    mov eax, 0
    ret

_start:                     ;
    lea eax, LIST           ; eax = &lista;
    mov ebx, 0x11           ; ebx = 17;
    mov ecx, SIZE           ; ecx = SIZE;
    call linearsearch       ; linearsearch(eax, ebx, ecx);

    mov eax, SYS_EXIT       ; fim_do_programa(0);
    mov ebx, EXIT           ;
    int SYS_CALL
