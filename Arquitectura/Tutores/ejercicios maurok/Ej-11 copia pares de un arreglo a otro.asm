; copia pares del arreglo "tabla" 
; a nuevo arreglo "pares" 
; by gmaurok
 
ORG 100h

tabla DB 2,9,6,12,45,33,99,67,3,1
pares DB 10 dup(0)


mov Cx,10   ; indico numero de iteraciones para barrer Tabla
mov Bx, 0   ; primer elemento del array
mov si,0

Bucle: 

      mov AL, tabla[BX]     ; [BX] contenido direccion de BX
      inc BX
      and AL ,1B            ; Si AL AND 1 = 0 es par
      jz  PAR               ; Salta a PAR: si resultado es = 0
                             
S:    Loop Bucle            ; decrementa CL contador loops 
      HLT 

PAR:  mov AH, tabla[BX-1]   ; guardo elemento par en ah  
                            ; pero en indice Bx-1 porque ya esta
                            ; preincrementado
      mov pares[si], AH     ; utilizo indice si
      inc si                ;incremento si
      loop S
       

