# Ejercicio 1: Resta de tres enteros (16 bits)

Este programa realiza la resta de tres números enteros usando registros de 16 bits (`AX`).  
La operación realizada es: `50 - 20 - 5 = 25`.

## Instrucciones utilizadas
- `mov`: para cargar valores a registros.
- `sub`: para realizar la resta.
- `movzx`: para ampliar a 32 bits antes de imprimir.
- `int 0x80`: para llamadas al sistema (escribir en pantalla y salir).

## Compilación y ejecución
```bash
nasm -f elf32 resta_tres.asm -o resta_tres.o
ld -m elf_i386 resta_tres.o -o resta_tres
./resta_tres
