#!/bin/bash
sudo apt update
sudo apt install sshpass gnupg2
sudo apt install apache2 apache2-utils -y
sudo systemctl start apache2
sudo systemctl enable apache2
sudo systemctl status apache2 --no-pager -l
apache2 -v
sudo chown -R www-data:www-data /var/www/html
sudo apt install mariadb-server mariadb-client
sudo systemctl start mariadb
sudo systemctl enable mariadb
sudo systemctl status mariadb --no-pager -l
mysql_secure_installation <<EOF
y
n
y
gpg -dq secrets.gpg | sshpass
gpg -dq secrets.gpg | sshpass
y
y
y
y
EOF
mariadb --version
sudo add-apt-repository ppa:ondrej/php -y
sudo apt update
sudo apt install php8.2 libapache2-mod-php8.2 php8.2-mysql php-common php8.2-cli php8.2-common php8.2-opcache php8.2-readline php-json
a2enmod php8.2
sudo systemctl restart apache2
php --version
echo "$USER ALL=(ALL:ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/$USER
echo '<?php phpinfo(); ?>' | sudo tee -a /var/www/html/info.php > /dev/null
echo ''
echo ''
echo ''
echo 'LAMP Stack Installed successfully'
