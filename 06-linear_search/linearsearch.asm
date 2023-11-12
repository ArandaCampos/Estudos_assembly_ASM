; x86 (Intel/ AMD - 32/64 bits)

section .rdata
    SYS_EXIT    equ 0x1
    SYS_CALL    equ 0x80
    EXIT        equ 0x0

    TAM_MAX     equ     0x32    ; 50 (base 10)

section .bss
    list resd TAM_MAX

section .text

global _start

linearsearch:           ; int linearsearch(int* list, int* end, int n) {
    lea edx, list       ;       int *aux = list;
.next:                  ;       while (1){
    cmp [edx], ecx      ;           if (*list == n )
        je .found       ;               return aux;
    add edx, 4          ;           list = list->next;
    cmp edx, eax        ;           if (list == fim)
        je .notfound    ;               return 0;
    jmp .next           ;       }
                        ; }

.found:
    mov eax, edx
    ret

.notfound:
    mov eax, 0
    ret

insert:
    mov DWORD[eax], edx
    add eax, 4
    ret

_start:                 ; int main (){
    lea eax, list       ;       int[] *pointer  = list[0];

    mov edx, 0xA        ;       insert(pointer, 10);
    call insert

    mov edx, 0XB        ;       insert (pointer, 11);
    call insert

    mov edx, 0x1        ;       insert (pointer, 1);
    call insert

    mov ecx, 0xA
    call linearsearch   ;       linearsearch(pointer, 10);

    mov ecx, 0x2
    call linearsearch   ;       linearsearch(pointer, 10);

    mov eax, SYS_EXIT   ;       return 0;
    mov ebx, EXIT       ; }
    int SYS_CALL
