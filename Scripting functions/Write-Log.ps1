Function Write-Log
{
 
    PARAM(
         [String]$Message,
         [String]$Path = "$env:USERPROFILE\DESKTOP\InstallationLog.Log",
         [int]$severity,
         [string]$component
         )
         
         $TimeZoneBias = Get-WmiObject -Query "Select Bias from Win32_TimeZone"
         $Date= Get-Date -Format "HH:mm:ss.fff"
         $Date2= Get-Date -Format "MM-dd-yyyy"
         
         "<![LOG[$Message]LOG]!><time=$([char]34)$date$($TimeZoneBias.bias)$([char]34) date=$([char]34)$date2$([char]34) component=$([char]34)$component$([char]34) context=$([char]34)$([char]34) type=$([char]34)$severity$([char]34) thread=$([char]34)$([char]34) file=$([char]34)$([char]34)>"| Out-File -FilePath $Path -Append -NoClobber -Encoding default
}
 
Write-Log -Message "Starting installation" -severity 1 -component "Installation"
Write-Log -Message "Something went wrong" -severity 2 -component "Installation"
Write-Log -Message "BIG Error Message" -severity 3 -component "Installation"