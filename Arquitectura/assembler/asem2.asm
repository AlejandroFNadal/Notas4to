org 100h

;Realice un programa que intercambie los contenidos de dos valores decimales definidos en dato1 y dato2

.data
var1 db 4h
var2 db 3h

.code 

mov ah, var1
mov al, var2
mov [var1], al
mov [var2], ah
.exit
