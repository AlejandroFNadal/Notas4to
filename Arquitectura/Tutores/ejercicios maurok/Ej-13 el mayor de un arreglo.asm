name "arreglo"
org 100h
;un areglo se puede acceder a travez de []
mov cx, 9 ;cuantos elementos voy a recorrer, empezamos con el 9
inicio:
 mov si, cx
 mov dl, v[si]
 cmp dl, mayor
 jng siguiente:
 mov mayor,dl
 siguiente:
 loop inicio
ret
v db 1,32,64,32,98,12,5,21,91,38
mayor db 0