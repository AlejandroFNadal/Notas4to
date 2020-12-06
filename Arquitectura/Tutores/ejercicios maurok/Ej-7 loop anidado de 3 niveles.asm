; Programa para realizar 3 bucles anidados
;
; By Gustavo Maurokefalidis
;
; Cbucle1, Cbucle2, y Cbucle3 define cantidad
; de iteraciones en cada loop  
; con PUSH y POP se guarda en pila valor cx
; antes de entrar a un LOOP nivel+1
; y se lo recupera al regresar a Loop nivel-1

include 'emu8086.inc'
org 100h       

CBucle1    dw  2
CBucle2    dw  3
CBucle3    dw  7

mov bx, 0  ; contador de bucles. 
mov cx, CBucle1                      

k1: add bx, 1 ; Bucle #1  
    printn '1'
    push cx
    mov cx, CBucle2   
    
      k2: add bx, 1 ; Bucle #2

      printn '  2 '
    
      push cx
         print '   '
         mov cx, CBucle3 
         
         k3: add bx, 1  ; Bucle #3
             print ' 3'
         loop k3        ; Fin Bucle #3  
         
      pop  cx   
      printn 
 
      loop  k2 ; Fin Bucle #3
       
    pop cx

loop k1 ; Fin Bucle #3 

hlt

