org 100h     

resA db 0
resI db 0
vector db 3,12,1,1,2,1,1,12,1,2,1,4,1,1,1 


mov bx, 0       
mov dl, vector[bx]      
mov resA, dx
mov bx, 1
mov cx, 14   


        
           
bucle: 
        mov dl, vector[bx]
        mov resI, bx
        and (resI),01h
        jnz par  
        mov al, (resA)
        mul dl
        mov resA, ax 
        

par:
        inc bx
        loop bucle   
        
