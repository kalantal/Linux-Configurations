@echo off
:A
Cls
echo MESSENGER
set /p n=User:
set /p m=Message:
net send %n% %m%
Pause
Goto A