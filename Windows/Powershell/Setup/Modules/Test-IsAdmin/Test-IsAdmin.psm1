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