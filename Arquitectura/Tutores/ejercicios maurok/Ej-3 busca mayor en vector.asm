; Ejercicio Nro 3: recorra vector 1,32,64,32,98,12,5,21,91,99.
; y almacene su mayor valor en variable Mayor
;
; CX: contador que evoluciona en cada iteracion Loop 
;  
; CMP:COmpara dos operandos y setea flags(OF, SF, ZF, AF, PF, CF)
; de acuerdo al resultado de la comparacion
;
; JNG: Salto si primer operando no es mayor que el segundo operando
; (segun orden de comparacion de CMP

org 100h    
    mov cx,9
inicio:
    mov si, cx  
    mov dl, v[si]
    cmp dl, mayor 
    jng siguiente ; Short salta si operando1<= operando2
    mov mayor, dl
siguiente:
    loop inicio    
    mov al, mayor 
   ret
   
   v db 1,32,64,32,98,12,5,21,91,99
   mayor db 0
