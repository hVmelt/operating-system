$top = Get-Process | Sort-Object WorkingSet64 -Descending | Select-Object -First 5

Write-Host "Top 5 processes by memory usage (WorkingSet):"
"{0,-25} {1,-8} {2,12}" -f "NAME","PID","MEM(MB)"
$top | ForEach-Object {
  "{0,-25} {1,-8} {2,12:N2}" -f $_.ProcessName, $_.Id, ($_.WorkingSet64 / 1MB)
}
