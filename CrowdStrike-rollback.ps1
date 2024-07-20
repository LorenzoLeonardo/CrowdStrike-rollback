# Check if it is running in safe mode
function Test-SafeMode {
    $regkey = Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\SafeBoot" -ErrorAction SilentlyContinue
    return $regkey -ne $null
}

if (-not (Test-SafeMode)) {
    Write-Host "The system is not in safe mode. Please reboot into safe mode or Windows recovery environment." -ForegroundColor Red
    exit
}

# Path to CrowdStrike directory
$directoryPath = "C:\Windows\System32\drivers\CrowdStrike"

# Check if the directory exists
if (Test-Path -Path $directoryPath) {
    # Find and delete the file that matches the pattern
    $files = Get-ChildItem -Path $directoryPath -Filter "C-00000291*.sys"
    if ($files.Count -gt 0) {
        foreach ($file in $files) {
            Remove-Item -Path $file.FullName -Force
            Write-Host "Deleted file: $($file.FullName)" -ForegroundColor Green
        }
    } else {
        Write-Host "No files found matching pattern C-00000291*.sys" -ForegroundColor Yellow
    }
} else {
    Write-Host "The directory $directoryPath does not exist." -ForegroundColor Red
}

# Reboot the system
Restart-Computer -Force
