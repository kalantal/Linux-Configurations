@echo off

:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------

@echo off
echo>list.txt
echo>list.txt list volume
@echo on
diskpart -s list.txt
@echo off
set /p DLA=Enter Desired Volume:
echo:
set /p LTT=Enter Desired Drive Letter:
echo:
cls
echo>move.txt
echo>move.txt list volume
echo>>move.txt select volume %DLA%
echo>>move.txt assign letter=%LTT%
@echo off
diskpart -s move.txt
echo:
Del /f "list.txt"
Del /f "move.txt"
echo.

if not exist %USERPROFILE%\Documents\WindowsPowershell\ md %USERPROFILE%\Documents\WindowsPowershell\
if not exist "C:\Admin\" md "C:\Admin\"
if not exist "C:\Google Drive\" md "C:\Google Drive\"
if not exist "C:\Google Drive\WindowsPowershell" md "C:\Google Drive\WindowsPowershell"
if not exist "%USERPROFILE%\Documents\Scripts" md "%USERPROFILE%\Documents\Scripts"

echo.
echo Powershell
xcopy /d /h /e /y /c /i /g /v /f "X:\WindowsPowershell" "%USERPROFILE%\Documents\WindowsPowershell"
echo.
echo System32
xcopy /d /h /e /y /c /i /g /v /f "X:\WindowsPowershell\Setup\Applications\PSTools" "C:\Windows\System32"
echo.
echo Scripts
xcopy /d /h /e /y /c /i /g /v /f "X:\Scripts" "%USERPROFILE%\Documents\Scripts"
echo.

call powershell.exe -ExecutionPolicy Unrestricted -Command "%USERPROFILE%\Documents\WindowsPowershell\Setup\WindowsEnviornement.ps1"

call powershell.exe -ExecutionPolicy Unrestricted -Command "%USERPROFILE%\Documents\WindowsPowershell\Setup\Modules\Get-ComFolderItem\pin.ps1"

call rundll32.exe %SystemRoot%\system32\shell32.dll,Control_RunDLL %SystemRoot%\system32\desk.cpl desk,@Themes /Action:OpenTheme /file:"%USERPROFILE%\Documents\WindowsPowershell\Setup\Black.theme"

cd X:\WindowsPowershell\Setup\Applications\Registry\
call ExplorerRegistry.bat

@echo off
taskkill /f /IM explorer.exe
start explorer.exe >nul
cls
exit