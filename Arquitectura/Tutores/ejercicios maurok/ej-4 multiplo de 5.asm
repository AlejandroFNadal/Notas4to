include 'emu8086.inc'

; DIV: (byte)
;        AL = AX / operando
;        AH = resto


ORG    100h 

;imprime titulos
printn 'MULTIPLO DE 5'
printn '======== == ='
printn                  ; salto de linea  
print 'Ingrese Numero:'   
call scan_num           ; input en CX.
 
printn  

mov ax,cx               ; mueve dividendo a ax

mov bl,5                ; mueve divisor a bl
div bl                  ; divide (ax) / bl y ah=resto 
cmp ah,0                ; compara resto en ah con 0     

je nm
   PRINT 'no es multiplo de 5.'
   jmp exit

nm:
   PRINT 'es multiplo de 5.'
exit:
   hlt

;--- definicion de procedimientos de impresion
;--- y captura de datos de libreria emu8086.inc

DEFINE_SCAN_NUM
 
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS  ; definir si se usa print_num.
END 

   