#Execution Policy
Set-ExecutionPolicy unrestricted -force -ErrorAction SilentlyContinue

#Set Module Path
New-Item -ErrorAction SilentlyContinue -type directory -path (((get-content env:\psmodulepath) -split ';')[0])

#Registry Tweaks
$key = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced'

Set-ItemProperty $key Hidden 1
Set-ItemProperty $key HideFileExt 0
Set-ItemProperty $key SuperHidden 1
Set-ItemProperty $key AlwaysShowMenus 1
Set-ItemProperty $key NavPaneShowAllFolders 1
Set-ItemProperty $key NavPaneExpandToCurrentFolder 1
Set-ItemProperty $key Start_NotifyNewApps 0
Set-ItemProperty $key Start_ShowMyComputer 2
Set-ItemProperty $key Start_ShowControlPanel 2
Set-ItemProperty $key Start_ShowRun 1
Set-ItemProperty $key StartMenuAdminTools 2

$key = 'HKCU:\Console\'
Set-Reg -key $key -name 'QuickEdit' -value 1 -type 'DWord'
Set-Reg -key $key -name 'ScreenBufferSize' -value 196608120 -type 'DWord'
Set-Reg -key $key -name 'WindowSize' -value 2621560 -type 'DWord'

Set-Reg -key 'HKCU:\Software\Microsoft\Internet Explorer\Main\' -name 'start page' -value 'http://www.google.com' -type 'String'
Set-Reg -key 'HKCU:\Software\Microsoft\Internet Explorer\Main\' -name 'IE8TourShown' -value 1 -type 'DWord'
Set-Reg -key 'HKCU:\Software\Microsoft\Internet Explorer\Main\' -name 'IE8RunOncePerInstallCompleted' -value 1 -type 'DWord'
Set-Reg -key 'HKCU:\Software\Microsoft\Internet Explorer\Main\' -name 'IE8TourNoShow' -value 1 -type 'DWord'
Set-Reg -key 'HKCU:\Software\Microsoft\Internet Explorer\Main\' -name 'DisableFirstRunCustomize' -value 1 -type 'DWord'
Set-Reg -key 'HKCU:\Software\Microsoft\Internet Explorer\Main\' -name 'IE9TourShown' -value 1 -type 'DWord'
Set-Reg -key 'HKCU:\Software\Microsoft\Internet Explorer\Main\' -name 'IE10TourShown' -value 1 -type 'DWord'
Set-Reg -key 'HKCU:\Software\Microsoft\Internet Explorer\Main\' -name 'IE11TourShown' -value 1 -type 'DWord'
Set-Reg -key 'HKCU:\Software\Microsoft\Internet Explorer\Main\' -name 'RunOnceComplete' -value 1 -type 'DWord'
Set-Reg -key 'HKCU:\Software\Microsoft\Internet Explorer\Main\' -name 'RunOnceHasShown' -value 1 -type 'DWord'
Set-Reg -key 'HKCU:\Software\Microsoft\Internet Explorer\Main\' -name 'Friendly http errors' -value 'no' -type 'String'
Set-Reg -key 'HKCU:\Software\Microsoft\Internet Explorer\Main\' -name 'Check_Associations' -value 'no' -type 'String'
Set-Reg -key 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings\' -name 'WarnonZoneCrossing' -value 0 -type 'DWord'
Set-Reg -key 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\' -name 'IEHarden' -value 0 -type 'DWord'
Set-Reg -key 'HKLM:\software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\' -name 'IEHarden' -value 0 -type 'DWord'
Set-Reg -key 'HKLM:\software\Microsoft\Active Setup\Installed Components\{A509B1A7-37EF-4b3f-8CFC-4F3A74704073}\' -name 'IsInstalled' -value 0 -type 'DWord'
Set-Reg -key 'HKCU:\Software\Microsoft\Internet Explorer\TabbedBrowsing\' -name 'WarnOnclose' -value 0 -type 'DWord'
Set-Reg -key 'HKCU:\Software\Microsoft\Internet Explorer\TabbedBrowsing\' -name 'OpenInForeground' -value 1 -type 'DWord'
Set-Reg -key 'HKCU:\Software\Microsoft\Internet Explorer\TabbedBrowsing\' -name 'Groups' -value 0 -type 'DWord'
Set-Reg -key 'HKCU:\Software\Microsoft\Internet Explorer\TabbedBrowsing\' -name 'NewTabNextToCurrent' -value 1 -type 'DWord'
Set-Reg -key 'HKCU:\Software\Microsoft\Internet Explorer\TabbedBrowsing\' -name 'NewTabPageShow' -value 1 -type 'DWord'
Set-Reg -key 'HKCU:\Software\Microsoft\Internet Explorer\TabbedBrowsing\' -name 'ShortcutBehavior' -value 1 -type 'DWord'
Set-Reg -key 'HKCU:\Software\Microsoft\Internet Explorer\TabbedBrowsing\' -name 'ThumbnailBehavior' -value 0 -type 'DWord'
Set-Reg -key 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\' -name 'ConfirmFileDelete' -value 1 -type 'DWord'
Set-Reg -key 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\StartPage\' -name 'OpenAtLogon' -value 0 -type 'DWord'

Stop-Process -processname explorer -Force

explorer.exe X:\WindowsPowershell\

Start-Process powershell
Set-Location C:\Windows\System32\
Write-Host