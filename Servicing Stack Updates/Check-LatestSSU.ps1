$LatestSSU = Get-WmiObject -Class "win32_quickfixengineering" | Where-Object -Property HotfixID -EQ KB4470788
if ($LatestSSU)
{
    Exit 0
}
else{
    Write-Host "Test"
}
