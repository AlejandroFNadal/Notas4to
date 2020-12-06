include 'emu8086.inc'
;
;Ejercicio Nro. 6: recorra segmento 2,9,5,12,45,33,99,67,3,1
; y contar cantidad de numeros impares (no divisibles por 2)
;
; AND entre valor binario del elemento y una mascara 0001
; devuelve 0-> PAR y 1-> Impar
;
; JZ: Salto si     

ORG 100h

tabla DB 2,9,5,12,45,33,99,67,3,1
fin_tabla DB ?   
cant_impar  DB 0

MOV BX, OFFSET tabla  
; Cantidad elementos a CL
MOV CL, OFFSET fin_tabla - OFFSET tabla 

Loop: MOV Ax, [BX]  
      INC BX 
      ; elemento and mascara=1    
      AND Ax ,1 
      ; Salto a contar Impar si no es Cero 
      JNZ IMPAR 
S:    DEC CL 
      JNZ Loop 
        
      ;imprime resultado
      mov al, cant_impar 
      print 'Cantidad de Impares: '
      CALL   print_num; imprime varlor de AX.
	  
      HLT 

IMPAR:INC cant_impar  
      JMP S     
      
;--- definicion de procedimientos de impresion
;--- y captura de datos de libreria emu8086.inc

DEFINE_SCAN_NUM
 
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS  ; definir si se usa print_num.
END 

   