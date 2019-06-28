title Do All
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
if not exist "%USERPROFILE%\Documents\Applications" md "%USERPROFILE%\Documents\Applications"
if not exist "%USERPROFILE%\Documents\Music" md "%USERPROFILE%\Documents\Music"
if not exist "%USERPROFILE%\Documents\Images" md "%USERPROFILE%\Documents\Images"

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
echo Applications
xcopy /d /h /e /y /c /i /g /v /f "X:\Applications" "%USERPROFILE%\Documents\Applications"
echo.
echo Music
xcopy /d /h /e /y /c /i /g /v /f "X:\Music" "%USERPROFILE%\Documents\Music"
echo.
echo Images
xcopy /d /h /e /y /c /i /g /v /f "X:\Images" "%USERPROFILE%\Documents\Images"
echo.

rundll32.exe %SystemRoot%\system32\shell32.dll,Control_RunDLL %SystemRoot%\system32\desk.cpl desk,@Themes /Action:OpenTheme /file:"%USERPROFILE%\Documents\WindowsPowershell\Setup\Black.theme"

powershell.exe -ExecutionPolicy Unrestricted -Command "%USERPROFILE%\Documents\WindowsPowershell\Setup\WindowsEnviornement.ps1"

powershell.exe -ExecutionPolicy Unrestricted -Command "%USERPROFILE%\Documents\WindowsPowershell\Setup\Modules\Get-ComFolderItem\pin.ps1"

explorer X:\WindowsPowershell

cd X:\WindowsPowershell\Setup\Applications\Registry\
call ExplorerRegistry.bat

pause