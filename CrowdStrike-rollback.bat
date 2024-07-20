@echo off
setlocal

:: Check if it is running in safe mode
reg query "HKLM\SYSTEM\CurrentControlSet\Control\SafeBoot" >nul 2>&1
if %errorlevel% neq 0 (
    echo The system is not in safe mode. Please reboot into safe mode or Windows recovery environment.
    exit /b
)

:: Path to CrowdStrike directory
set "directoryPath=C:\Windows\System32\drivers\CrowdStrike"

:: Check if the directory exists
if exist "%directoryPath%" (
    :: Find and delete the file that matches the pattern
    for %%F in ("%directoryPath%\C-00000291*.sys") do (
        del /f C:\Windows\System32\drivers\CrowdStrike\C-00000291*.sys
        ren C:\Windows\System32\drivers\CrowdStrike C:\Windows\System32\drivers\CrowdStrike.old
        echo File deleted successfully!!!
    )
    
    :: Check if files were deleted
    if errorlevel 1 (
        echo No files found matching pattern C-00000291*.sys
    )
) else (
    echo The directory %directoryPath% doesn't exist.
)

echo remove the pendrive, to reboot the system press enter
pause
:: Reboot the system
shutdown /r /f /t 0
