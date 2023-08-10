## LAMP Stack Installation

### Apache installation
```
sudo apt update -y && apt upgrade -y
sudo apt install apache2 apache2-utils -y
sudo systemctl start apache2
sudo systemctl enable apache2
sudo systemctl status apache2
apache2 -v
```
check on browser with ip of server
we need to set www-data (Apache user) as the owner of document root
```
sudo chown -R www-data:www-data /var/www/html
```
### Installing MariaDB
```
sudo apt install mariadb-server mariadb-client
sudo systemctl start mariadb
sudo systemctl enable mariadb
sudo systemctl status mariadb
```
creating root password for mariadb
```
mysql_secure_installation
Enter current password for root (enter for none): enter
Set root password? [Y/n] Y
New password:******
Re-enter new password:******
Remove anonymous users? [Y/n]Y
Disallow root login remotely? [Y/n]Y
Remove test database and access to it? [Y/n]Y
Reload privilege tables now? [Y/n]Y
```
login to mariadb
```
mariadb -u root -p
MariaDB [(none)]> exit
```
```
mariadb --version
```

### PHP installation
```
sudo add-apt-repository ppa:ondrej/php
sudo apt update
sudo apt install php8.2 libapache2-mod-php8.2 php8.2-mysql php-common php8.2-cli php8.2-common php8.2-opcache php8.2-readline php-json
```
Enable the Apache php8.2 module then restart Apache Web server.
```
a2enmod php8.2
```
restart the apache server and check the version
```
sudo systemctl restart apache2
php --version
```
Test with php test page
```
sudo vim /var/www/html/info.php
<?php phpinfo(); ?>
:wq! save and exit
```
in terminal
```
curl http://<server_ip>/info.php
```
or in browser
```
http://<server_ip>/info.php
```
after test remove the info.php 
```
rm /var/www/html/info.php
```
LAMP is successfully installed.
