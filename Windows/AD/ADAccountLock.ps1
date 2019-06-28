$AccountLockOutEvent = Get-EventLog -LogName "Security" -InstanceID 4740 -Newest 1
$LockedAccount = $($AccountLockOutEvent.ReplacementStrings[0])
$LockedAccount=$LockedAccount.substring(0,2).toupper()+$LockedAccount.substring(2)
$AccountLockOutEventTime = $AccountLockOutEvent.TimeGenerated
$AccountLockOutEventMessage = $AccountLockOutEvent.Message
$Subject = "Account Locked Out: $LockedAccount" 
$Body = "$LockedAccount was locked out on 
$AccountLockOutEventTime.`n`nEvent Details:`n`n$AccountLockOutEventMessage"
           ###########################################################################
# Please Configure the following variables....
$smtpServer = "smtp.office365.com"
$From = $LockedAccount+"@domain.com"
$To = "support@domain.com"
$O365UserAcct = "user@domain.com"
$O365UserAcctPwd = "P@ssw0rd"  
  ########################################################################### 

$SMTPClient = New-Object Net.Mail.SmtpClient($SmtpServer, 587) 
$SMTPClient.EnableSsl = $true 
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential($O365UserAcct, $O365UserAcctPwd); 
$SMTPClient.Send($From, $To, $Subject, $Body)