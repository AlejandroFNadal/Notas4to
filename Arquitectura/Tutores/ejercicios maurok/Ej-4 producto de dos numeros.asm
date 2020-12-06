include 'emu8086.inc'

ORG    100h
producto    dw 0
 
;imprime titulos
             
PRINTN 'PRODUCTO DE DOS NUMEROS'
PRINTN '======== == === ======='

printn                    ; salto de linea  
print 'Multiplicador:'   
CALL   scan_num           ; pide numero y almacena en CX.
ADD    producto, cx    

printn
print 'Multiplicando :'       
CALL   scan_num           ; multiplicando en CX.
                     
multi:                    ; loop hasta que cx=0
    add ax,producto
    loop multi                        

printn
print 'Producto:'       
CALL   print_num          ; imprime varlor de AX.

RET                           

;--- definicion de procedimientos de impresion
;--- y captura de datos de libreria emu8086.inc
DEFINE_SCAN_NUM
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS  ; definir si se usa print_num.
END                  
                   