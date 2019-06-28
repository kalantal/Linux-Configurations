#Justin Restivo
#09/30/15

$ErrorActionPreference= 'silentlycontinue'

Write-Host "Process killer for the JDC RDP farm" $File.FullName -ForegroundColor Green
Write-Host ""

$process_name = Read-Host "Enter Process Name" 
$user = Read-Host "Enter User Name"

Write-Host ""
Write-Host "Starting!" $File.FullName -ForegroundColor Green
Write-Host ""

$Computers = 01..25 | %{'JDCRD' + $_.ToString().PadLeft(2,'0')}

ForEach($Computer in $Computers){
    if(Test-Connection -ComputerName $Computer -Count 1 -Quiet){
        try{
            Get-WmiObject -Class Win32_Process -Filter "Name= '$process_name'" -ComputerName $Computer | Where-Object { $_.GetOwner().User -eq $user } | Foreach-Object { $_.Terminate() } 
            Write-Host " + Process killed in $Computer" $File.FullName -ForegroundColor Red
        } catch {
            Write-Host " x Could not kill process on $Computer" $File.FullName
        }
    } else {
        Write-Host " - $Computer is Offline" $File.FullName
    }
}
Write-Host ""
Write-Host "Complete!" $File.FullName -ForegroundColor Green
Write-Host ""
Write-Host "-----------------" $File.FullName -ForegroundColor Red
Write-Host ""
Write-Host "Starting FD-User!" $File.FullName -ForegroundColor Green
Write-Host ""

ForEach($Computer in $Computers){
    if(Test-Connection -ComputerName $Computer -Count 1 -Quiet){
        try{
            Get-WmiObject -Class Win32_Process -Filter "Name= '$process_name'" -ComputerName $Computer | Where-Object { $_.GetOwner().User -eq $user } | Foreach-Object { $_.Terminate() } 
            Write-Host " + Process killed in $Computer" $File.FullName -ForegroundColor Red
        } catch {
            Write-Host " x Could not kill process on $Computer" $File.FullName
        }
    } else {
        Write-Host " - $Computer is Offline" $File.FullName
    }
}
Write-Host ""
Write-Host "Complete! Application restarting!" $File.FullName -ForegroundColor Green
Write-Host ""
Write-Host "---------------------------------" $File.FullName -ForegroundColor Red
Write-Host ""

.\processkiller.ps1

$host.enternestedprompt()