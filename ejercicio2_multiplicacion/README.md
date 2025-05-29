# Ejercicio 2: Multiplicación de dos enteros (8 bits)

## Descripción
Este programa multiplica dos números enteros (6 * 7) utilizando **solo registros de 8 bits** (`AL`, `BL`).  
El resultado (42) se convierte a cadena de texto y se muestra por pantalla.

---

## Instrucciones utilizadas

| Instrucción | Descripción |
|-------------|-------------|
| `mov`       | Carga valores en los registros de 8 bits |
| `mul`       | Multiplica `AL` * otro registro de 8 bits (`BL`) |
| `movzx`     | Amplía el resultado de 16 bits a 32 bits para impresión |
| `div`       | Convierte el resultado a texto |
| `int 0x80`  | Imprime texto por consola y finaliza el programa |

---

## Compilación y ejecución

```bash
nasm -f elf32 multiplicacion.asm -o multiplicacion.o
ld -m elf_i386 multiplicacion.o -o multiplicacion
./multiplicacion
