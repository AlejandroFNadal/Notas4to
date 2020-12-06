;Ejercicio Rodrigo
;lee por teclado numeros y almacena en vector
;imprime resultado por pantalla.

include emu8086.inc


org 100h
.DATA
    vec dw ? ; cargar un vector con constantes
    msg1 db  13,10,"PROGRAMA QUE CARGA UN VECTOR DE 10 ELEMENTOS:$" ;
    mensaje db 13,10,"INGRESE UN NUMERO:$" ;
.CODE  
    mov ax, @Data
    mov ds, ax
    mov bx,0    ; en bx tenemos la posición dentro del vector, inicia en 0
    mov cx,5   ; descontador cantidad de posiciones del vector.
   
   
bucle:  
    push cx
    ;push ax        ;resguardamos en pila el resultado
    mov dx,offset mensaje           ; cargo mensaje a imprimir
    mov ah,09h                      ; valor a cargar para imprimir caracteres
    int 21h                         ; llamada a interrupcion.
    ;pop ax          ; recupero valor
    CALL   scan_num           ; pide numero y almacena en CX.  
    mov vec[bx], cx ; cargamos en DL el elemen0to del vector indicado en BX
    inc bx         ; incrementamos BX, avanza el vector
    pop cx
    loop bucle     ; loop y decrementa cx.
                   ; fin del loop , imprimir resultado.

    printn ; imprime linea nueva
 
    ; imprimimos el vector caargado  
    mov bx,0    ; en bx tenemos la posición dentro del vector, inicia en 0
    mov cx,5   ; cx descuenta hasta llegar a cero con Loopr.

bucle2:
     mov dx, vec[bx]
     ;CALL   print_num; imprime varlor de AX. 
     ; imprimo a pantalla por interrupcion pero antes le sumo 30h al caracter
     ; ascii para que sea numero
     
     
     ADD DX, 30h  ;convierto digito a char y almaceno en DX

     ;imprimo caracter en DX 
     MOV AH, 2h
     INT 21h
              
     printn ; imprime linea nueva
             
     inc bx
     ; pop cx no va esto
     loop bucle2 ; decrementa cx hasta que llegue a cero
     
     
    ret             ; volver al sistema operativo
   
   
;--- definicion de procedimientos de impresion

;--- y captura de datos de libreria emu8086.inc

DEFINE_SCAN_NUM

DEFINE_PRINT_NUM

DEFINE_PRINT_NUM_UNS  ; definir si se usa print_num.

END 

