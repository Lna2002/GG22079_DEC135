section .data
    mensaje db "Resultado: ", 0
    salto db 10, 0

section .bss
    buffer resb 4  ; hasta 3 dígitos + nulo

section .text
    global _start

_start:
    ; Multiplicación 6 * 7 usando registros de 8 bits
    mov al, 6      ; Primer número (8 bits)
    mov bl, 7      ; Segundo número (8 bits)
    mul bl         ; AL * BL = AX

    ; Convertir resultado de AX a EAX para imprimir
    movzx eax, ax

    ; Convertir número a cadena
    mov ecx, buffer + 3
    mov byte [ecx], 0

convertir:
    dec ecx
    xor edx, edx
    mov ebx, 10
    div ebx
    add dl, '0'
    mov [ecx], dl
    test eax, eax
    jnz convertir

    ; Imprimir mensaje
    mov eax, 4
    mov ebx, 1
    mov ecx, mensaje
    mov edx, 10
    int 0x80

    ; Imprimir resultado convertido
    mov eax, 4
    mov ebx, 1
    mov edx, buffer + 3
    sub edx, ecx
    mov ecx, ecx
    int 0x80

    ; Imprimir salto de línea
    mov eax, 4
    mov ebx, 1
    mov ecx, salto
    mov edx, 1
    int 0x80

    ; Salida
    mov eax, 1
    xor ebx, ebx
    int 0x80
