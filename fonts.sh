
# JETBrains
# Change to the Downloads directory
cd ~/Downloads

# Set the file name (without extension)
FONT_ZIP="JetBrainsMono.zip"
FONT_DIR="${FONT_ZIP%.zip}"  # Remove the .zip extension to get the folder name

# Download the JetBrainsMono font
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/$FONT_ZIP

# Create a directory with the same name as the ZIP file (without the extension)
mkdir -p "$FONT_DIR"

# Unzip the font into the newly created directory
unzip "$FONT_ZIP" -d "$FONT_DIR"

# Move the font files to the system fonts directory
sudo mv "$FONT_DIR" /usr/share/fonts/

# Apple Fonts
# Change to the Downloads directory
cd ~/Downloads

# Install dependencies if not already installed
sudo apt install -y dmg2img p7zip-full

# Download the SF Pro DMG file from Apple
echo "Downloading SF Pro fonts..." | cowsay
wget https://devimages-cdn.apple.com/design/resources/download/SF-Pro.dmg

# Convert the DMG file to ISO format (needed for extraction)
dmg2img SF-Pro.dmg SF-Pro.iso

# Extract the ISO content using 7zip
7z x SF-Pro.iso -oSF-Pro

# The font files should be in the extracted folder
# Create a directory for the fonts
mkdir -p ~/Downloads/SF-Pro

# Move the extracted .otf files into the fonts directory
cp -r ~/Downloads/SF-Pro/*.otf ~/Downloads/SF-Pro/

# Move the SF Pro fonts to the system fonts directory
sudo mv ~/Downloads/SF-Pro /usr/share/fonts/

# Update font cache
sudo fc-cache -fv

