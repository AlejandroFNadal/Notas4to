; Programa Ordenar arreglo de numeros > a <
; Metodo de la burbuja
;
; By Gustavo Maurokefalidis
;
; Cbucle1, Cbucle2, define cantidad
; de iteraciones en cada loop  
; con PUSH y POP se guarda en pila valor cx
; antes de entrar a un LOOP nivel+1
; y se lo recupera al regresar a Loop nivel-1

include 'emu8086.inc'
org 100h       

tabla DB 2,9,5,12,45,33,99,67,3,1
fin_tabla DB ? 

CBucle1    dw  10
CBucle2    dw  10


mov bx, 0  ; contador de bucles. 
mov cx, CBucle1                      

k1: add bx, 1 ; Bucle #1  
    printn '1'
    push cx
    mov cx, CBucle2   
    
      k2: add bx, 1 ; Bucle #2

      printn '  2 '
    
      printn 
 
      loop  k2 ; Fin Bucle #3
       
    pop cx

loop k1 ; Fin Bucle #3 

hlt

 Fin Bucle #3  
         
      pop  cx   
      printn 
 
      loop  k2 ; Fin Bucle #3
       
    pop cx

loop k1 ; Fin Bucle #3 

ret

