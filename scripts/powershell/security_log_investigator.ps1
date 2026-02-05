$Log = "server.log"

@"
INFO Startup complete
WARN Low disk space
ERROR Failed to connect to database
INFO User login succeeded
ERROR Timeout while contacting service
INFO Health check OK
ERROR Invalid credentials provided
"@ | Set-Content -Path $Log -Encoding UTF8

# Count lines that contain the string "Error" (case-sensitive)
$Count = (Select-String -Path $Log -Pattern "Error").Count

Write-Host "Created $Log"
Write-Host "Lines containing 'Error': $Count"
