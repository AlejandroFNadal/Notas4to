	org 100h
	.data

	var1 db 1h
	var2 db 3h

	.code

	mov ah, var1
	mov bh, var2
	add ah,bh
	.exit
	
