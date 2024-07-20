# CrowdStrike-rollback
## Descripción
CrowdStrike-rollback.ps1 is a PowerShell script designed to automate the process of removing a specific CrowdStrike-related file that may be causing problems on your Windows system. This script must be run in Safe Mode or Windows Recovery Environment.

## Problem with CrowdStrike
CrowdStrike is a security solution that protects endpoints against threats. However, in some situations, certain CrowdStrike files may become corrupted or cause problems that prevent the system from functioning properly. In this specific case, a file named `C-00000291*.sys` in the `C:\Windows\System32\drivers\CrowdStrike` directory must be deleted to resolve the issue.

## Instructions for use

### Step 1: Preparation
- Make sure you have administrator permissions on the system where the script will be executed.
- Save the script in a file called `CrowdStrike-rollback.ps1`.

### Step 2: Start in Safe Mode
1. Reboot the system and enter Safe Mode or Windows Recovery Environment.
2. To enter Safe Mode, hold down the **Shift** key while clicking "Restart" and then select:
   - "Solve problems"
   - "Advanced Options"
   - "Startup Settings"
   - "Restart"
   - Next, select the option for Safe Mode.
3. To enter the Windows Recovery Environment, follow a similar process and select:
   - "Solve problems"
   - "Advanced Options"
   - "Symbol of the system".

### Step 3: Run the Script

1. Open PowerShell with administrator privileges.
2. Navigate to the directory where the script was saved.
3. Run the script with the following command:

   ```powershell
   .\CrowdStrike-rollback.ps1
   ```
I hope it helps you at least automate the issue by a percentage.

