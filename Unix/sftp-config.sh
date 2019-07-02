#!/bin/bash

sftpuser=$(whoami)

sudo mkdir -p /var/sftp/uploads
sudo chown root:root /var/sftp
sudo chmod 755 /var/sftp
sudo chown "$sftpuser":"$sftpuser" /var/sftp/uploads

sudo sed '0,/PasswordAuthentication no/s/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
sudo sed '0,/X11Forwarding yes/s/X11Forwarding yes/X11Forwarding no/' /etc/ssh/sshd_config
sudo sed -i "s/ChrootDirectory none/ChrootDirectory %h/" /etc/ssh/sshd_config
echo "Match User access" | sudo tee -a /etc/ssh/sshd_config
echo "ForceCommand internal-sftp" | sudo tee -a /etc/ssh/sshd_config

cat /etc/ssh/sshd_config

sudo systemctl restart sshd
