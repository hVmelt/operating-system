Write-Host "=== System Health Snapshot ==="
Write-Host ("Date/Time : {0}" -f (Get-Date))
Write-Host ("Hostname  : {0}" -f $env:COMPUTERNAME)
Write-Host ("User      : {0}" -f $env:USERNAME)
Write-Host ""

# Main drive: C:
$drive = Get-PSDrive -Name C
$total = $drive.Used + $drive.Free
$freeGB = [math]::Round($drive.Free / 1GB, 2)
$totalGB = [math]::Round($total / 1GB, 2)

Write-Host "Disk Usage (C:)"
Write-Host ("Free:  {0} GB" -f $freeGB)
Write-Host ("Total: {0} GB" -f $totalGB)
