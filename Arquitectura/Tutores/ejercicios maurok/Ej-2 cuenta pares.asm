; Ejercicio Nro 2: contar cantidad de nros.pares
; segmento de datos: 2,9,5,12,45,33,99,67,3,1. 
; Resultado en variable cant_par
; 
; AND entre el elemento leido en AL (binario)
; y mascara 0000 0001 devuelve 0 (par) o 
; 1 (impar). 
;
; JZ Salto si resultado es cero (cant_par)
; sino cuento impar (cant_impar) 
ORG 100h

tabla DB 2,9,5,12,45,33,99,67,3,1

fin_tabla DB ?   
resultado DB 0 
cant_par  db 0

mov BX, OFFSET tabla                        ; Carga en BX direccion de Tabla 
mov CL, OFFSET fin_tabla - OFFSET tabla     ; Carga en Cl la canidad de elementos

Loop:
      mov AL, [BX]                          ; [BX] contenido direccion de BX
      inc BX   
      and AL ,1B 
      jz  PAR                               ; Salta a PAR: si resultado es = 0 
S:    dec CL                                ; decrementa CL contador loops 
      jnz Loop                              ; Itera si resultado es <>0
      HLT 

PAR:  inc cant_par  
      jmp S
       

