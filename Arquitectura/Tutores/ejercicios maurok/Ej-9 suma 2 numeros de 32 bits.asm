; Suma dos numeros de 32 bits
; Gustavo Maurokefalidis
;                   
; ResH y ResL componen el resultado en 32 bits
; Se define rutina ADD32 para sumar en 32 bits

; ADD32 se la debe definir antes del programa

org 100h

; n1h y n1l -> 12347256h
N1h   dw  1234h
N1l   dw  7256h ; a proposito para que haya carry

; n2h y n2l -> 56789203h                   
N2h   dw  5678h
N2l   dw  9203h      

Resh  dw  ?
Resl  dw  ?

mov ax,N1h
mov bx,N2h
mov cx,N1l
mov dx,N2l

add32:  add cx,dx   ; N1l+N2l 
        JNC NoCarry
        inc ax      ; si hay carry pre incremento N1h

NoCarry:add ax,bx   ; N1h+N2h

Result:
        mov ResH,ax ; Bits mayor peso de suma a ax
        mov ResL,cx ; Bits menor peso de suma a cx
    

hlt

