org 100h 

resI db ?
vector db 20,12,1,1,1,1,32,12,23,2,3,4,5,1,2  


mov bx, 0
mov cx, 15   
mov dx, 0 
mov ax, 0  
        
           
bucle: 
        mov dl, vector[bx]
        mov (resI), bx
        and (resI),01h
        jz par
        add ax,dx
        

par:                 
        inc bx  
        loop bucle   
        

;------------------------------------------
;--------Multiplo de 3---------------------
bucle2: 
        sub ax,03h
        js noes 
        jz esmul 
        loop bucle2

esmul: 
        mov ax,01h 
        and ax, 01h
        jnz terminar
noes: 
        mov ax, 02h
terminar: 
    