# Define TWOW Directory
TWOW_DIR="/home/$USER/Games/turtlewow/drive_c/Program Files (x86)/TurtleWoW/"

# Concatenate Interface/AddOns to TWOW_DIR
ADDONS_DIR="/home/$USER/Games/turtlewow/drive_c/Program Files (x86)/TurtleWoW/Interface/AddOns/"

# Navigate to the AddOns directory
cd "$ADDONS_DIR"

# Clone the repositories
git clone https://github.com/TheLinuxITGuy/Turtle-Dragonflight.git
git clone https://github.com/balakethelock/SuperAPI.git
git clone https://github.com/shagu/pfQuest.git
git clone https://github.com/shagu/pfQuest-turtle.git

# Move Turtle-Dragonflight into the AddOns folder
mv "${ADDONS_DIR}/Turtle-Dragonflight" "${ADDONS_DIR}/"

# Move Minimap and TargetingFrame into the Interface folder
mv "${ADDONS_DIR}/Turtle-Dragonflight/Interface/Minimap" "${TWOW_DIR}/Interface/"
mv "${ADDONS_DIR}/Turtle-Dragonflight/Interface/TargetingFrame" "${TWOW_DIR}/Interface/"

# Remove the Turtle-Dragonflight directory - After the restructure, this wont be needed
# rm -rf "${ADDONS_DIR}/Turtle-Dragonflight"

# Navigate to the TurtleWoW directory
cd "$TWOW_DIR"

# Download the SuperWoW release
wget https://github.com/balakethelock/SuperWoW/releases/download/Release/SuperWoW.release.1.5.1.zip

# Extract the zip file
unzip SuperWoW.release.1.5.1.zip

# Remove the zip file
rm SuperWoW.release.1.5.1.zip
