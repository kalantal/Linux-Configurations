@echo off
setlocal
cls
echo.
echo JDC Server Ping Tool
echo.
echo Remote Desktops
call :PingVerbose jdcrd01
call :PingVerbose jdcrd02
call :PingVerbose jdcrd03
call :PingVerbose jdcrd04
call :PingVerbose jdcrd05
call :PingVerbose jdcrd06
call :PingVerbose jdcrd07
call :PingVerbose jdcrd08
call :PingVerbose jdcrd09
call :PingVerbose jdcrd10
call :PingVerbose jdcrd11
call :PingVerbose jdcrd12
call :PingVerbose jdcrd13
call :PingVerbose jdcrd14
call :PingVerbose jdcrd15
call :PingVerbose jdcrd16
call :PingVerbose jdcrd17
call :PingVerbose jdcrd18
call :PingVerbose jdcrd19
call :PingVerbose jdcrd20
call :PingVerbose jdcrd21
call :PingVerbose jdcrd22
call :PingVerbose jdcrd23
call :PingVerbose jdcrd24
call :PingVerbose jdcrd25
echo.
echo FaxFinder
call :PingVerbose 10.0.9.12
echo.
echo Shoretel
call :PingVerbose 10.0.9.2
echo.
echo Atlas
call :PingVerbose 10.0.16.72
echo.
echo Sophos
call :PingVerbose 10.0.16.99
echo.
echo Jepsen
call :PingVerbose 10.0.16.71
echo.
echo 0.0.0.0
call :PingVerbose 0.0.0.0
echo.
echo 0.0.0.0
call :PingVerbose 0.0.0.0
echo.
echo 0.0.0.0
call :PingVerbose 0.0.0.0

pause>nul
endlocal
exit /b 0

:Ping <Address>
ping "%~1" -n 1 >nul
exit /b %ErrorLevel%

:PingVerbose <Address>
call :Ping %1 && echo    %~1 is Online || echo %~1 Offline
exit /b %ErrorLevel%