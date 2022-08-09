
yes | apt update && apt upgrade && apt install curl && apt install speedtest-cli

# pause to see intermediate result.
read -n1 -s -r -p $'Everything is ready to proceed with unatteneded upgrade setup. Press space to continue...\n' key

yes | sudo apt install unattended-upgrades && sudo apt install update-notifier-common && sudo echo -e "APT::Periodic::Update-Package-Lists \"1\";\nAPT::Periodic::Unattended-Upgrade \"1\";\n" > /etc/apt/apt.conf.d/20auto-upgrades && sudo systemctl restart unattended-upgrades 
#sudo systemctl status unattended-upgrades

# pause to see intermediate result.
read -n1 -s -r -p $'Everything is ready to disable ipv6. Press space to continue...\n' key

sed -i '/GRUB_CMDLINE_LINUX/ s/"$/ ipv6.disable=1"/' /etc/default/grub && sudo update-grub

# pause to see intermediate result.
read -n1 -s -r -p $'Everything is ready to change port to 222. Press space to continue...\n' key

sudo ufw allow 2222 && sudo sed -i -e 's/#Port 22/Port 2222/g' /etc/ssh/sshd_config && service sshd reload && sudo ufw status


# pause to see intermediate result. 
read -n1 -s -r -p $'Everything is ready to proceed with non root user setup. Press space to continue...\n' key

nonroot=0dmin4eg && sudo useradd -m -c "$nonroot" $nonroot -s /bin/bash && usermod -aG sudo $nonroot && sudo passwd $nonroot && sudo sed -i 's/PermitRootLogin yes/PermitRootLogin no/g' /etc/ssh/sshd_config && sudo service ssh reload
