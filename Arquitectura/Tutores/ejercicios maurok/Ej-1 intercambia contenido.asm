; Ejercicio 1: intercambie los contenidos de dos 
; valores decimales definidos en dato1 y dato2.  
;
; XCHG realiza el intercambio entre los valores de los
; operandos de la siguiente forma: 
; 
; XCHG reg, mem 
; XCHG reg, reg 
; XCHG mem, reg 


ORG 100h

dato1 DB 0 
dato2 db 0

mov dato1, 45
mov dato2, 60

mov al, dato1       
mov ah, dato2  
XCHG al, al

mov dato1, ah
mov dato2, al

