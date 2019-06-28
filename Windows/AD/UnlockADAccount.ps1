########
# Prep #
########
$VERSION="1.1"
$UPDATED=2014-01-16
$CUR_DATE=get-date -f "yyyy-MM-dd"
 
#############
# VARIABLES # -- Set these to your desired values
#############
# Logging information. No trailing slashes (\) on directory names
$LOGPATH=$env:systemdrive + "\Logs"
$LOGFILE=$env:computername + "_AD_unlock_account.log"
 
 
#############
# EXECUTION #
#############
# If no arguments were passed, spit out a message and die.
# AKA if "$args" is false / aka not true, then do this stuff
if (! $args) {
        write-host
        Write-Host "Pass names of accounts to unlock, separated by spaces. e.g. .\unlock_AD_account.ps1 MyAccountName MySecondAccountName" -foregroundcolor white
        write-host
        Break
        }
 
# Log that the script was triggered
"$CUR_DATE "+ $(get-date -f "hh:mm:ss") + " Account lockout script triggered. Executing..." >> $LOGPATH\$LOGFILE
 
# Do the unlock
foreach ($i in $args) {
        unlock-adaccount $i
        write-host $i unlocked -foregroundcolor green
        "$CUR_DATE "+ $(get-date -f "hh:mm:ss") + " $i unlocked" >> $LOGPATH\$LOGFILE
        #if $LASTEXITCODE -ne "0" write-host $i failed to unlock -foregroundcolor red
        }