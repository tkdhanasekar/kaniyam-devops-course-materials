#!/bin/bash

# create password .secrets and encrypt

sudo apt update
sudo apt install sshpass gnupg2
sudo apt install apache2 apache2-utils -y
sudo systemctl start apache2
sudo systemctl enable apache2
sudo systemctl status apache2 --no-pager -l
apache2 -v
sudo chown -R www-data:www-data /var/www/html
sudo apt install mariadb-server mariadb-client -y
sudo systemctl start mariadb
sudo systemctl enable mariadb
sudo systemctl status mariadb --no-pager -l
mysql_secure_installation

mariadb --version
sudo add-apt-repository ppa:ondrej/php -y
sudo apt update
sudo apt install php8.2 libapache2-mod-php8.2 php8.2-mysql php-common php8.2-cli php8.2-common php8.2-opcache php8.2-readline php-json
a2enmod php8.2 -y
sudo systemctl restart apache2
php --version
#echo "$USER ALL=(ALL:ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/$USER
#echo '<?php phpinfo(); ?>' | sudo tee -a /var/www/html/info.php > /dev/null
#rm /var/www/html/info.php
echo ''
echo ''
echo ''
echo 'LAMP Stack Installed successfully'


echo "Enter database Name!"
read dbname
echo "Creating new MySQL database..."

mysql -e "CREATE DATABASE ${dbname};" 
echo "Database successfully created!"
echo "Enter database user!"
read username

#echo "Enter the PASSWORD for database user!"
echo "Note: password will be hidden when typing"
#read -p "Enter your password: " password
#read -p "Please enter your password: " password

echo "Please enter your password: "
stty -echo
read passwd
stty echo

echo "Creating new user..."
mysql -e "CREATE USER ${username}@localhost IDENTIFIED BY '${passwd}';"
echo "User successfully created!"

echo "Granting ALL privileges on ${dbname} to ${username}!"
mysql -e "GRANT ALL PRIVILEGES ON ${dbname}.* TO '${username}'@'localhost';"
mysql -e "FLUSH PRIVILEGES;"
echo "You are good now"
wget https://wordpress.org/latest.zip
sudo apt install zip -y
unzip latest.zip
rm latest.zip
sudo mv wordpress/ /var/www/html/
sudo chown www-data:www-data -R /var/www/html/wordpress/
sudo chmod -R 755 /var/www/html/wordpress/
ip=$(hostname -I | cut -f1 -d ' ')
cat <<EOF > /etc/apache2/sites-available/wordpress.conf
<VirtualHost *:80>
ServerAdmin admin@example.com
DocumentRoot /var/www/html/wordpress
ServerName $ip
<Directory /var/www/html/wordpress/>
Options FollowSymLinks
AllowOverride All
Require all granted
</Directory>
ErrorLog ${APACHE_LOG_DIR}/error.log
CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
EOF

sudo a2ensite wordpress.conf
sudo systemctl reload apache2
sudo a2enmod rewrite
sudo systemctl restart apache2
echo " "
echo " "
echo " "
echo 'wordpress Installed successfully'
echo http://$ip
