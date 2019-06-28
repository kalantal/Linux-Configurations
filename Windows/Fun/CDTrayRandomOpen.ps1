function CDTray ($mode) {
$MemDef = @"
[DllImport("winmm.dll", CharSet = CharSet.Ansi)]
   public static extern int mciSendStringA(
   string lpstrCommand,
   string lpstrReturnString,
   int uReturnLength,
   IntPtr hwndCallback);
"@
 
$winnm = Add-Type -memberDefinition $MemDef -ErrorAction 'SilentlyContinue' -passthru -name mciSendString
$winnm::mciSendStringA("set cdaudio door $mode", $null, 0,0)
 
}
 
$open = $null
$closed = $true
 
while($true){
    $num = Get-Random -Minimum 0 -Maximum 9
    if($num -eq 5) {
        if($open) {
            CDTray "closed"
            $open = $false
            $closed = $true
        }
        elseif($closed) {
            CDTray "open"
            $open = $true
            $closed = $false
        }
    }
    sleep 60
}