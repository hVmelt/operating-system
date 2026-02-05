$files = Get-ChildItem -Filter *.txt -File

$renamed = 0
foreach ($f in $files) {
  if ($f.Name -like "OLD_*") { continue }

  $newName = "OLD_" + $f.Name
  if (Test-Path -Path $newName) {
    Write-Host "Skipping (target exists): $($f.Name) -> $newName"
    continue
  }

  Rename-Item -Path $f.FullName -NewName $newName
  Write-Host "Renamed: $($f.Name) -> $newName"
  $renamed++
}

Write-Host "Done. Renamed $renamed file(s)."
