# Ejercicio 3: División de dos enteros (32 bits)

## Descripción
Este programa realiza la división de dos números enteros (100 ÷ 4) utilizando registros de 32 bits (`EAX`, `EBX`, `EDX`).  
El resultado (25) se convierte a texto decimal y se muestra en consola.

---

## Instrucciones utilizadas

| Instrucción | Descripción |
|-------------|-------------|
| `mov`       | Carga los números en registros de 32 bits |
| `xor`       | Limpia EDX para evitar errores en la división |
| `div`       | Realiza la división: `EAX / EBX` |
| `add`       | Convierte número a carácter ASCII |
| `int 0x80`  | Llamadas al sistema para imprimir resultado y salir |

---

## Compilación y ejecución

```bash
nasm -f elf32 division.asm -o division.o
ld -m elf_i386 division.o -o division
./division
