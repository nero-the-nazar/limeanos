@echo off

title LimeanOS Builder

echo LimeanOS Builder v.0.1
echo Developed by Nazar Prokudin.
pause

echo Building...
FASM bootloader.asm bootload.bin
FASM kernel.asm kernel.bin
FASM fileTable.asm fileTable.bin
FASM LimeanOS.asm LimeanOS.bin

echo Build completed sucessfuly!
pause