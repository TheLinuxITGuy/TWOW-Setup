$ErrorActionPreference = "Stop"
$env:GIT_REDIRECT_STDERR = '2>&1'

# Check if the script is running as an administrator
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    # Relaunch the script with elevated privileges
    $newProcess = Start-Process powershell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs -PassThru
    # Exit the current non-elevated session
    exit
}

# Define TWOW Directory
$TWOW_DIR = "D:\Games\Turtlewow"

# Define AddOns Directory
$ADDONS_DIR = Join-Path $TWOW_DIR "Interface\AddOns"

# Define an array of directory paths
$directories = @(
    "$ADDONS_DIR\pfQuest",
    "$ADDONS_DIR\pfQuest-turtle",
    "$ADDONS_DIR\SuperAPI",
    "$ADDONS_DIR\Turtle-Dragonflight",
    "$TWOW_DIR\Interface\Minimap",
    "$TWOW_DIR\Interface\TargetingFrame"
)

# Loop through each directory in the array
foreach ($dir in $directories) {
    # Check if the directory exists
    if (Test-Path -Path $dir) {
        # Remove the directory and its contents
        Remove-Item -Path $dir -Recurse -Force
        Write-Host "Removed directory: $dir"
    } else {
        Write-Host "Directory does not exist: $dir"
    }
}

# Navigate to the AddOns directory
Set-Location -Path $ADDONS_DIR

# Clone the repositories
git clone https://github.com/TheLinuxITGuy/Turtle-Dragonflight.git
git clone https://github.com/balakethelock/SuperAPI.git
git clone https://github.com/shagu/pfQuest.git
git clone https://github.com/shagu/pfQuest-turtle.git

# Move Minimap and TargetingFrame into the Interface folder
Move-Item -Path "$ADDONS_DIR\Turtle-Dragonflight\Interface\Minimap" -Destination "$TWOW_DIR\Interface" -Force
Move-Item -Path "$ADDONS_DIR\Turtle-Dragonflight\Interface\TargetingFrame" -Destination "$TWOW_DIR\Interface" -Force

# Navigate to the TurtleWoW directory
Set-Location -Path $TWOW_DIR

# Define an array of SuperWoW files
$superWoW = @(
    "$TWOW_DIR\SuperWoWhook.dll",
    "$TWOW_DIR\SuperWoWlauncher.exe"
)

# Loop through each file in the array
foreach ($item in $superWoW) {
    # Check if the SuperWoW files exist
    if (Test-Path $item) {
        # Remove the file
        Remove-Item $item -Force
        Write-Host "Removed: $item"
    } else {
        Write-Host "File does not exist: $item"
    }
}

# Add a Windows Defender exclusion for SuperWoW
try {
    Add-MpPreference -ExclusionPath $TWOW_DIR
    Write-Host "Successfully added exclusion path: $TWOW_DIR"
    Start-Sleep -Seconds 5
} catch {
    Write-Host "Failed to add exclusion path: $TWOW_DIR"
    Write-Host "Error: $_"
}

# Download the SuperWoW release
Invoke-WebRequest -Uri "https://github.com/balakethelock/SuperWoW/releases/download/Release/SuperWoW.release.1.3.zip" -OutFile "$TWOW_DIR\SuperWoW.release.1.3.zip"

# Extract the zip file
Expand-Archive -Path "$TWOW_DIR\SuperWoW.release.1.3.zip" -DestinationPath $TWOW_DIR -Force

# Remove the zip file
Remove-Item -Path "$TWOW_DIR\SuperWoW.release.1.3.zip" -Force
