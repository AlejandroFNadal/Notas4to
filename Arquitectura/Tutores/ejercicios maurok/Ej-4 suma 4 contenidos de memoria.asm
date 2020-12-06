; Ejercicio 3: sumar contenido de las direcciones
; 385Ah, 385Bh, 385Ch y 385Dh.
; inicializadas con valores 14, 22, 51, 33 
; Guardar resultado en 385Fh. 
;
; [DIR] = contenido de DIR


ORG 100h 
 
mov [385Ah],14      ; mueve 14 a dir 385Ah
mov [385Bh],22      ; mueve 22 a dir 385Bh
mov [385Ch],51      ; mueve 51 a dir 385Ch
mov [385Dh],33      ; mueve 33 a dir 385Dh

ADD AL,[385Ah]      ; Al = Al + (385Ah)
ADD AL,[385Bh]      ; Al = Al + (385Bh)
ADD AL,[385Ch]      ; Al = Al + (385Ch)
ADD AL,[385Dh]      ; Al = Al + (385Dh)

mov [385Fh],AL      ; mueve (AL) a Dir 385Fh



