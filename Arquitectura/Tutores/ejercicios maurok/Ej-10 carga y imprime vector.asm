include emu8086.inc
name "carga-imprime-vector"
.MODEL SMALL
org 100h
.DATA
    vec  db ? ; cargar un vector con constantes
    msg1 db  13,10,"PROGRAMA QUE CARGA UN VECTOR DE 10 ELEMENTOS:$" ;
    msg2 db  13,10,"Imprimimos los valores ingresados: $" ;  
    msg3 db  13,10,"Cantidad de elementos:$>"
    msg  db  13,10,"INGRESE UN NUMERO:$" ;    
    cloop   db 0
.CODE  
    mov ax, @Data
    mov ds, ax
    mov bx,0            ; posicion vector inicia en 0

    mov dx,offset msg1  ; cargo mensaje a imprimir
    mov ah,09h          ; valor a cargar para imprimir caracteres
    int 21h             ; llamada a interrupcion.
    printn   
                        ; imprime linea nueva 
    mov dx,offset msg3  ; cargo mensaje a imprimir
    mov ah,09h          ; valor a cargar para imprimir caracteres
    int 21h             ; llamada a interrupcion.    
    call scan_num
    mov cloop,cx        ; resguarda cantidad elementos vector
    printn    
    
bucle:  
    push cx
    mov dx,offset msg   ; cargo mensaje a imprimir
    mov ah,09h          ; valor a cargar para imprimir caracteres
    int 21h             ; llamada a interrupcion.
    CALL   scan_num     ; pide numero y almacena en CX.  
    mov vec[bx], cx     ; cargamos en DL el elemen0to del vector indicado en BX
    inc bx              ; incrementamos BX, avanza el vector
    pop cx
    loop bucle          ; loop y decrementa cx.

    ;imprimimos el vector caargado  
    mov bx,0            ; posicion dentro del vector, inicia en 0
    mov cx, cloop       ; cantidad de loops para impresion
    printn
    mov dx,offset msg2  ; cargo mensaje a imprimir
    mov ah,09h          ; valor a cargar para imprimir caracteres
    int 21h             ; llamada a interrupcion.

bucle2:
     push cx
     mov ah, 0
     mov al, vec[bx]
     CALL   print_num   ; imprime varlor de AX.  
     inc bx
     pop cx
     print ' '                          
     loop bucle2

     ret                ; volver al sistema operativo

;--- definicion de procedimientos de impresion
;--- y captura de datos de libreria emu8086.inc

DEFINE_SCAN_NUM
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS  ; definir si se usa print_num.

END

     push cx
     mov ah, 0
     mov al, vec[bx]
     CALL   print_num; imprime varlor de AX.  
     inc bx
     pop cx
     print ','                          
     loop bucle2
     
     
    ret             ; volver al sistema operativo
   
   
;--- definicion de procedimientos de impresion

;--- y captura de datos de libreria emu8086.inc

DEFINE_SCAN_NUM

DEFINE_PRINT_NUM

DEFINE_PRINT_NUM_UNS  ; definir si se usa print_num.

END
