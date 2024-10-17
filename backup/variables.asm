cmdString:         db ' ', 0
prompt:            db 'limean:> ', 0xA, 0xD, 0
cmdSysInfo:        db 'systeminfo', 0
cmdReboot:         db 'reboot', 0
cmdSnakeGame:      db 'snake', 0
notMakedString:    db ' ', 0xA, 0xD, 'Sorry! But this command/function not maked now. :(', 0xA, 0xD, 0     
goBackMsg:         db ' ', 0xA, 0xD, 'Press any key to go back...', 0xA, 0xD, 0
cmdLength:         db 0