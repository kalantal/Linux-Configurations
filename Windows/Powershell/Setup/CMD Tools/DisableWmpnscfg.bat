@ECHO off

::This will disable the Windows Media Player Network Sharing Service and wmpnscfg.exe.

taskkill /F /IM wmplayer.exe
"%PROGRAMFILES%\Windows Media Player\wmpnscfg.exe" /Close

::Stopping and disabling Windows Media Player Network Sharing Service(wmpnetwk.exe)
SC stop "WMPNetworkSvc"
SC config WMPNetworkSvc start= disabled

::Adding reg
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\MediaPlayer\Preferences\HME" /v DisableDiscovery /t REG_DWORD /d 00000002 /f

::Removing the startup entry
REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run" /v WMPNSCFG /f
CLS