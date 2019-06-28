function prompt { 

   $cdelim = [ConsoleColor]::DarkCyan 
   $chost = [ConsoleColor]::Green 
   $cloc = [ConsoleColor]::Cyan 

   write-host "$([char]0x0A7) " -n -f $chost 
   write-host '{' -n -f $cdelim 
   write-host ((pwd).Path) -n -f $cloc
   write-host '}' -n -f $cdelim
   write-host ':' -n
   return ' ' 
}