;;;
;;; Ядро LimeanOS
;;;

        

mainMenu:
        ;;Выбор видеорежима
        mov ah, 0x00
        mov al, 0x03 ;0x08/0х03 - мой режим
        int 0x10
        
        mov ah, 0x0B
        mov bh, 0x00
        mov bl, 0x01 ;  Задний фон (синий цвет) 0 - черный, 1 - синий, 2 - зеленый, 3 - желтый, 4 - красный, 5 - фиолетовый, 6 - коричневый, 7 - светло-серый, 8 - темно-серый, 9 - светло-синий, A - светло-зеленый, B - светло-желтый, C - светло-красный, D- светло-фиолетовый, E - светло-коричневый, F – Белый.ц
        int 0x10
        
        ;; Печать приветсвенной записи (Я не шарю как писать на русском языке в ассемблер)
        
        mov si, welcomeString     ;;; Вывод приветствия на экран
        call printString       ;;; Вызов функции printString для вывода текста на экран
        mov si, menuLine1
        call printString
        mov si, menuHelp
        call printString
        mov si, menuLine2
        call printString
        
        
        ;;; Действия с пользователем с помощью коммандной строки
getInput:
        mov di, cmdString
        
keyloop:
        xor ax, ax
        int 0x16
        
        mov ah, 0x0e
        cmp al, 0xD
        je runCommand
        
        int 0x10
        mov [di], al
        inc di
        jmp keyloop

runCommand:
        mov byte [di], 0
        mov al, [cmdString]
        cmp al, 's'
        je systeminfo
        cmp al, 'r'
        je reboot
        cmp al, 'g'
        je gameSnake
        cmp al, 'h'
        je help
        jmp getInput
        
gameSnake:
        mov si, notMaked
        call printString
        jmp getInput
        
inputNotFound:
        mov si, errorString
        call printString
        jmp getInput

help:
        mov si, helpStringA
        call printString
        mov si, helpStringB
        call printString
        mov si, helpStringC
        call printString
        jmp getInput
                       
reboot:
        jmp 0xFFFF:0x0000
             
systeminfo:
        mov si, sysINFO
        call printString
        jmp getInput
                                                  
endPRGM:
        cli    ;;; Очистка прерываний
        hlt    ;;; Остановка действий процессора
  
              
        ;; Инклуды
        include "functions/printString.asm"
        include "functions/sysInfo.asm"
        include "functions/snakeGame.asm"
        include "functions/menu.asm"
	include "functions/help.asm"
        include "variables.asm"
        
        systemErrorString:  db 'System error: Please reboot/shutdown your pc now!', 0xA, 0xD, 0
        failString:      db ' ', 0xA, 0xD, 'Oops! Somthing went wrong. :(', 0xA, 0xD, 0
        errorString:     db 0xA, 0xD, 'Command not found!', 0xA, 0xD, 0

           
          times 4086-($-$$) db 0            