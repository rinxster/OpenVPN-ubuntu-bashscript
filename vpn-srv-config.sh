# !/bin/bash
#install updates and required programs
yes | sudo apt update
yes | sudo apt upgrade
yes | sudo apt install mc && apt install fail2ban && apt install curl

#configure and setup regular  automatic updates
yes | sudo apt install unattended-upgrades
yes | sudo apt install update-notifier-common
sudo echo -e "APT::Periodic::Update-Package-Lists \"1\";\nAPT::Periodic::Unattended-Upgrade \"1\";\n" > /etc/apt/apt.conf.d/20auto-upgrades
sudo systemctl restart unattended-upgrades
#sudo systemctl status unattended-upgrades

#configure fail2ban
sudo cp /etc/fail2ban/jail.{conf,local}
sudo sed -i -e 's/bantime  = 10m/bantime  = 1d/g' /etc/fail2ban/jail.local
sudo systemctl restart fail2ban
#sudo systemctl status fail2ban

#configure and start ufw
yes | sudo apt install ufw
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
sudo ufw allow 22
sudo ufw allow 1194
yes | sudo ufw enable
#sudo ufw status verbose

# pause to see intermediate result. Everything is ready to proceed with OpenVPN installlation
read -n1 -s -r -p $'Everything is ready to proceed with OpenVPN installlation. Press space to continue...\n' key

#download openvpn installation script and install openvpn on server
wget https://git.io/vpn -O openvpn-install.sh
sudo chmod +x openvpn-install.sh
sudo bash openvpn-install.sh

#disable ipv6 for security as not used and reboot the server
sed -i '/GRUB_CMDLINE_LINUX/ s/"$/ ipv6.disable=1"/' /etc/default/grub
sudo update-grub
sudo shutdown -r +1
