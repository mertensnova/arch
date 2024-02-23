cd
cd Desktop
mkdir tools
cd tools

# Run https://blackarch.org/strap.sh as root and follow the instructions.
curl -O https://blackarch.org/strap.sh
echo 26849980b35a42e6e192c6d9ed8c46f0d6d06047 strap.sh | sha1sum -c
chmod +x strap.sh
sudo ./strap.sh
sudo pacman -Syu


echo "Esstentials..."
sudo pacman -S bettercap  ettercap  dnsmasq  hostapd-wpe  iptables  aireplay-ng 
sudo pacman -S bully  pixiewps  dhcpd  asleap  packetforge-ng  hashcat
sudo pacman -S wpaclean  hostapd  tcpdump  etterlog  tshark  mdk4
sudo pacman -S wash  hcxdumptool reaver hcxpcapngtool john crunch beef  lighttpd 

# Installing Metasploit
echo "Installing Metasploit Framework..."
sudo pacman -S metasploit
sudo pacman -S exploitdb

# Installing Nmap
echo "Installing Nmap..."
sudo pacman -S nmap net-tools iw

echo "Web Enumeartion..."
yay -S gobuster dirb fuff
sudo pacman -S whatweb whois
git clone https://github.com/danielmiessler/SecLists.git
sudo mv SecLists /usr/share

echo "Insatliingin wifi"
sudo pacman -S aircrack-ng

