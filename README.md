# TWOW-Setup
![GitHub Release](https://img.shields.io/github/v/release/TheLinuxITGuy/TWOW-Setup?style=for-the-badge&labelColor=%231A365D&color=%23E9FC12)
![GitHub Downloads (all assets, all releases)](https://img.shields.io/github/downloads/TheLinuxITGuy/TWOW-Setup/total?style=for-the-badge&labelColor=%231A365D&color=%23E9FC12)


## 🛠️ Installation
This script makes it easy to install tDF, pfQuest, pfQuest-turtle, SuperAPI, and SuperWoW on Linux and Windows

### Linux
1. Install twow from Lutris
2. Download this script
3. From a Terminal: 
    1. `chmod u+x TWOW-Setup.sh`
    2. Type: `./TWOW-Setup.sh`
    3. Point Lutris to `SuperWoWlauncher.exe`
    4. Start Turtle WoW and enjoy

### Windows
1. Download and install Turtle WoW from [turtle-wow.org](https://turtle-wow.org/)
2. Install [Git for Windows](https://git-scm.com/downloads/win)
3. Download this script
4. Update the `$TWOW_DIR` variable in `TWOW-Setup.ps1` to point to the location where you installed Turtle WoW (where WoW.exe is stored)
5. From an Administrator PowerShell prompt or Windows Terminal:
    1. Type `./TWOW-Setup.ps1`
    2. Create or update a shortcut to `SuperWoWlauncher.exe` wherver you'd like (on your desktop for example)
    2. Start Turtle WoW from the newly created shortcut and enjoy

> **_NOTE:_** SuperWoW is flagged as a Trojan by Windows Defender. This is a false positive as stated on [the github issue](https://github.com/balakethelock/SuperWoW/issues/20#issuecomment-2186479946). Therefore, this script creates a Windows Defender exception for the Turtle WoW directory before downloading SuperWoW.