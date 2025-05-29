section .data
    mensaje db "Resultado: ", 0
    salto db 10, 0   ; Salto de línea

section .bss
    buffer resb 4        ; Buffer para máximo 3 dígitos + nulo

section .text
    global _start

_start:
    ; Operación: 50 - 20 - 5 = 25
    mov ax, 50
    sub ax, 20
    sub ax, 5

    ; Convertimos AX (resultado) a EAX para usarlo
    movzx eax, ax

    ; Convertir número a texto decimal en buffer
    mov ecx, buffer + 3   ; Posición final del buffer
    mov byte [ecx], 0     ; Fin de cadena

convertir:
    dec ecx
    xor edx, edx
    mov ebx, 10
    div ebx               ; Divide EAX entre 10 -> cociente en EAX, residuo en EDX
    add dl, '0'           ; Convertimos residuo a ASCII
    mov [ecx], dl
    test eax, eax
    jnz convertir

    ; Imprimir mensaje
    mov eax, 4
    mov ebx, 1
    mov ecx, mensaje
    mov edx, 10
    int 0x80

    ; Imprimir número
    mov eax, 4
    mov ebx, 1
    mov edx, buffer + 3
    sub edx, ecx          ; Tamaño del número convertido
    mov edx, edx
    mov ecx, ecx
    int 0x80

    ; Salto de línea
    mov eax, 4
    mov ebx, 1
    mov ecx, salto
    mov edx, 1
    int 0x80

    ; Salida
    mov eax, 1
    xor ebx, ebx
    int 0x80
