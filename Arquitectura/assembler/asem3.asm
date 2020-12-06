;3. Realice un programa que sume dos numeros enteros, ingresados por teclado

org 100h

.code 
mov ah, 1h
int 21h

mov dl, al
mov ah, 2h
int 21h

.exit

