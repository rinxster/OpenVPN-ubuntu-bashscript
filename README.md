# OpenVPN bashscript for ubuntu

This short bash script patches server + installs and configures ufw, fail2ban and open vpn server.
Also it configures and sets up regular  automatic updates.
Just copy paste command below and run it on your vanilla Ubuntu server that is just deployed on your cloud to make it OpenVPN server.

```
sudo wget https://raw.githubusercontent.com/rinxster/OpenVPN-ubuntu-bashscript/main/vpn-srv-config.sh -O vpn-srv-config.sh && sudo chmod +x vpn-srv-config.sh && sudo bash vpn-srv-config.sh
```
Tested and works well on Ubuntu 20 LTS.


NB: old servers fix:
```
sudo wget https://raw.githubusercontent.com/rinxster/OpenVPN-ubuntu-bashscript/main/security-hardening.sh -O security-hardening.sh && sudo chmod +x security-hardening.sh && sudo bash security-hardening.sh
```


