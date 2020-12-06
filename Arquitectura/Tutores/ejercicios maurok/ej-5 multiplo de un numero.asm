include 'emu8086.inc'

; DIV: (byte)
;        AL = AX / operando
;        AH = resto


ORG    100h 

;imprime titulos
printn 'MULTIPLOS'
printn '========='
printn                  ; salto de linea  
print 'Ingrese Numero:'   
call scan_num           ; input en CX.
mov ax,cx               ; mueve dividendo a ax 
printn  
print 'Ingrese Multiplo:'   
call scan_num           ; input en CX.
printn  
mov bl,cx               ; mueve divisor a bl
div bl                  ; divide (ax) / bl y ah=resto 
cmp ah,0                ; compara resto en ah con 0     

je nm
   PRINT 'El Numero ingresado no es multiplo.'
   jmp exit

nm:
   PRINT 'El Numero ingresado es multiplo.'
exit:
   hlt

;--- definicion de procedimientos de impresion
;--- y captura de datos de libreria emu8086.inc

DEFINE_SCAN_NUM
 
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS  ; definir si se usa print_num.
END 

   