function show-info {
Write-Host $env:computername" - "$env:Username"@"$env:userdnsdomain - PowerShell Version $PSVersionTable.PSVersion - ((Get-Date).ToString())
}