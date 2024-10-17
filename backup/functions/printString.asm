printString:
        pusha
        mov ah, 0x0e
        mov bh, 0x0
        mov bl, 0x07
        
printChar:
        lodsb
        cmp al, 0
        je endPrint
        int 0x10
        jmp printChar
       
endPrint:
        popa
        ret