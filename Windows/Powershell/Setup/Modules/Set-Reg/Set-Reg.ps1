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