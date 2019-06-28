
@echo off
color 0E
mode con lines=22 cols=86
echo>list.txt
echo>list.txt list volume
@echo on
diskpart -s list.txt
@echo off
set /p DLA=Enter desired volume:
echo:
set /p LTT=Enter drive letter:
echo:
echo>move.txt
echo>move.txt list volume
echo>>move.txt select volume %DLA%
echo>>move.txt assign letter=%LTT%
@echo off
diskpart -s move.txt
echo:
Del /f "list.txt"
Del /f "move.txt"
echo:
echo:
pause

explorer X:\WindowsPowershell

exit /b