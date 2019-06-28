function Set-Profile{
$Host.UI.RawUI.WindowTitle=”Powershell”

$pshost = get-host
$pswindow = $pshost.ui.rawui

$newsize = $pswindow.buffersize
$newsize.height = 1000
$newsize.width = 150
$pswindow.buffersize = $newsize

$newsize = $pswindow.windowsize
$newsize.height = 50
$newsize.width = 150
$pswindow.windowsize = $newsize

$Host.UI.RawUI.ForegroundColor = 'white'
$Host.UI.RawUI.BackgroundColor = 'black'

$host.PrivateData.ErrorForegroundColor = 'red'
$host.privatedata.ErrorBackgroundColor = 'Black'
$host.privatedata.WarningForegroundColor = 'yellow'
$host.privatedata.WarningBackgroundColor = 'Black'
$host.privatedata.VerboseForegroundColor = 'green'
$host.privatedata.VerboseBackgroundColor = 'Black'
$host.privatedata.ProgressForegroundColor = 'red'
$host.privatedata.ProgressBackgroundColor = ' black'
}

function show-info {
Write-Host $env:computername" - "$env:Username"@"$env:userdnsdomain - PowerShell Version $PSVersionTable.PSVersion - ((Get-Date).ToString())
}

function Test-IsAdmin {

If (([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole(`
    [Security.Principal.WindowsBuiltInRole]::Administrator))
	{
    Write-host "You have Administrator rights!" $File.FullName -ForegroundColor Green
    Break
	}
If (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole(`
    [Security.Principal.WindowsBuiltInRole]::Administrator))
	{
    Write-host "You do not have Administrator rights!" $File.FullName -ForegroundColor Red
    Break
	}
}

function Set-Reg {
    param (
        [string]$key,
        [string]$name,
        [string]$value,
        [string]$type
    )
 
    If((Test-Path -Path $key) -eq $false) {
        New-Item -Path $key
    }
    $k = Get-Item -Path $key
    If($k.GetValue($name) -eq $null) {
        New-ItemProperty -Path $key -Name $name -Value $value -PropertyType $type
    } else {
        Set-ItemProperty -Path $key -Name $name -Value $value
    }
}