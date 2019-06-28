cd X:\WindowsPowershell\

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