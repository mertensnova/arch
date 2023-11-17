
echo " Download and Run the BlackArch Strap Script " 
curl -O https://blackarch.org/strap.sh
chmod +x strap.sh
sudo ./strap.sh
sudo pacman -Syy

# Installing Metasploit
echo "Installing Metasploit Framework..."
sudo pacman -S metasploit

# Installing Nmap
echo "Installing Nmap..."
sudo pacman -S nmap net-tools



echo "Web Enumeartion..."
yay -S gobuster dirb fuff
sudo pacman -S whatweb
git clone https://github.com/danielmiessler/SecLists.git
sudo mv SecLists /usr/share
