#!/bin/bash

if grep -q Citi /etc/issue; then
	echo "Skipping RHEL subscription registration"
	else subscription-manager register --username jr09824 --auto-attach
fi

yum install git dos2unix -y
yum upgrade -y

#Main
if [ ! -f bashrc ]; then
	echo "No bashrc"
fi

if grep -q Kali ~/.bashrc; then
	echo "bashrc already configured"
	else cat bashrc | sudo tee -a ~/.bashrc
fi

#Phoenix
if grep -q Citi /etc/issue; then
	if grep -q Kali /etc/profile; then
		echo "bashrc already configured"
		else cat bashrc | sudo tee -a /etc/profile
	fi
fi

git config --global user.name "Justin Restivo"
git config --global user.email justin.restivo@citi.com
git config --global push.default matching

exit 0
