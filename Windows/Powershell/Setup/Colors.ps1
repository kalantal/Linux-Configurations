$HOST.UI.RawUI.BackgroundColor = "Black"
$HOST.UI.RawUI.ForegroundColor = "White"

## Change colors of regular text
$Host.UI.RawUI.BackGroundColor = "black"
$Host.UI.RawUI.ForeGroundColor = "DarkYellow" 

## Change colors of special messages (defaults shown)
$Host.PrivateData.DebugBackgroundColor = "Black"
$Host.PrivateData.DebugForegroundColor = "Yellow"
$Host.PrivateData.ErrorBackgroundColor = "Black"
$Host.PrivateData.ErrorForegroundColor = "Red"
$Host.PrivateData.ProgressBackgroundColor = "DarkCyan"
$Host.PrivateData.ProgressForegroundColor = "Yellow"
$Host.PrivateData.VerboseBackgroundColor = "Black"
$Host.PrivateData.VerboseForegroundColor = "Yellow"
$Host.PrivateData.WarningBackgroundColor = "Black"
$Host.PrivateData.WarningForegroundColor = "Yellow"

## Set the format for displaying Exceptions (default shown)
## Set this to "CategoryView" to get less verbose, more structured output
## http://blogs.msdn.com/powershell/archive/2006/06/21/641010.aspx
$ErrorView = "NormalView"

## NOTE: This section is only for PowerShell 1.0, it is not used in PowerShell 2.0 and later
## More control over display of Exceptions (defaults shown), if you want more output
$ReportErrorShowExceptionClass = 0
$ReportErrorShowInnerException = 0
$ReportErrorShowSource = 1
$ReportErrorShowStackTrace = 0

## Set display of special messages (defaults shown)
## http://blogs.msdn.com/powershell/archive/2006/07/04/Use-of-Preference-Variables-to-control-behavior-of-streams.aspx
## http://blogs.msdn.com/powershell/archive/2006/12/15/confirmpreference.aspx
$ConfirmPreference = "High"
$DebugPreference = "SilentlyContinue"
$ErrorActionPreference = "Continue"
$ProgressPreference = "Continue"
$VerbosePreference = "SilentlyContinue"
$WarningPreference = "Continue"
$WhatIfPreference = 0