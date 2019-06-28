@echo off
set /p 1="Enter IP Address or Name: "
ping %1% -t
pause