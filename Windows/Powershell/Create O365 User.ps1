#Justin Restivo
#09/30/15

Get-PSSession | Remove-PSSession

Write-Host "Office 365 User Creation Tool" $File.FullName -ForegroundColor Green
Write-Host ""
Write-Host ""
Write-Host "Please enter your admin credentials to proceed." $File.FullName -ForegroundColor Red
Write-Host ""

#Login
Import-Module MSOnline
$LiveCred = Get-Credential
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://ps.outlook.com/powershell/ -Credential $LiveCred -Authentication Basic -AllowRedirection
Import-PSSession $Session
Connect-MsolService –Credential $LiveCred

#Import DirSync
import-Module DirSync

#Syncs with outlook.office365.com
Start-OnlineCoexistenceSync

#Sets e-mail user password

$USER = Read-Host "e-mail address"
$PASS = Read-Host "password"

Set-MsolUserPassword -UserPrincipalName $USER -NewPassword $PASS -ForceChangePassword $False
Set-MsolUser -UserPrincipalName $USER -UsageLocation US
Set-MsolUserLicense -UserPrincipalName $USER -AddLicenses jdcweb:EXCHANGESTANDARD

Write-Host "Complete! Starting CoExistanceSync" -ForegroundColor Green
Start-OnlineCoexistenceSync

Start-Sleep -s 1000
$host.enternestedprompt()
