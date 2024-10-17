;;;
;;; Загрузчик LimeanDOS
;;;
        org 0x7c00   ; Число для загрузки в первые 512 байт системы.
        
        ;;; Загрузка Файловой Таблицы в оперативную память в так называемую "Первую Очередь".
        mov bx, 0x1000
        mov es, bx
        mov bx, 0x0

        mov dh, 0x0
        mov dl, 0x0
        mov ch, 0x0
        mov cl, 0x02

readDisk1:
        mov ah, 0x02
        mov al, 0x01
        int 0x13
        
        jc readDisk1
        
        mov bx, 0x2000
        mov es, bx
        mov bx, 0x0

        mov dh, 0x0
        mov dl, 0x0
        mov ch, 0x0
        mov cl, 0x03

readDisk2:
        mov ah, 0x02
        mov al, 0x01
        int 0x13
        
        jc readDisk2
        
        mov ax, 0x2000
        mov ds, ax
        mov es, ax
        mov fs, ax
        mov gs, ax
        mov ss, ax
       
        
        jmp 0x2000:0x0
        
        times 508-($-$$) db 0
        
        dw 0x55, 0xAA