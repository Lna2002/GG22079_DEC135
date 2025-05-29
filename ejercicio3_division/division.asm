section .data
    mensaje db "Resultado: ", 0
    salto db 10, 0

section .bss
    buffer resb 12     ; Suficiente espacio para resultado en texto

section .text
    global _start

_start:
    ; División de 100 / 4 usando registros de 32 bits
    mov eax, 100       ; Dividendo (32 bits)
    mov ebx, 4         ; Divisor  (32 bits)
    xor edx, edx       ; Limpiar EDX antes de dividir (parte alta del dividendo)
    div ebx            ; EAX = cociente, EDX = residuo

    ; Convertir resultado (EAX) a texto decimal
    mov ecx, buffer + 11
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

    ; Imprimir resultado
    mov eax, 4
    mov ebx, 1
    mov edx, buffer + 11
    sub edx, ecx
    mov edx, edx
    mov ecx, ecx
    int 0x80

    ; Salto de línea
    mov eax, 4
    mov ebx, 1
    mov ecx, salto
    mov edx, 1
    int 0x80

    ; Salida del programa
    mov eax, 1
    xor ebx, ebx
    int 0x80
