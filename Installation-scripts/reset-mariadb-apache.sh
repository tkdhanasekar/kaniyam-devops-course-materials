#!/bin/bash

# remove apache2
sudo systemctl stop apache2
sudo apt remove --purge apache2 -y
sudo apt autoremove -y
sudo apt autoclean

# remove mariadb
sudo systemctl stop mariadb.service
sudo apt remove --purge mariadb* -y
sudo rm -r /etc/mysql/
sudo apt autoremove -y
sudo apt autoclean

echo " "
echo " "
echo "apache and mariadb removed successfully"
