;;
;; Функия вывода системных ошибок
;;

systemErrorString:  db 'System error: Please reboot/shutdown your pc now!', 0xA, 0xD, 0
failString:      db ' ', 0xA, 0xD, 'Oops! Somthing went wrong. :(', 0xA, 0xD, 0
notFoundString:     db ' ', 0xA, 0xD, 'Command not found!', 0xA, 0xD, 0
