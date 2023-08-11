## Wordpress Installation

Install LAMP Stack before install wordpress
- [LAMP Stack Installation](https://github.com/tkdhanasekar/kaniyam-devops-course-materials/blob/main/Linux/lamp-stack.md)

Login to mariadb and create wordpress user and wordpress database and give privileges
```
mysql -u root -p
```
```
CREATE USER 'wpuser'@'localhost' IDENTIFIED BY 'kan123';
CREATE DATABASE wpdb;
GRANT ALL PRIVILEGES ON wpdb.* TO 'wpuser'@'localhost';
FLUSH PRIVILEGES;
exit;
```

download the latest wordpress zip file
```
wget https://wordpress.org/latest.zip
unzip latest.zip
rm latest.zip
sudo mv wordpress/ /var/www/html/
sudo chown www-data:www-data -R /var/www/html/wordpress/
sudo chmod -R 755 /var/www/html/wordpress/
```

create wordpress configuration file
```
sudo vim /etc/apache2/sites-available/wordpress.conf
```
```
<VirtualHost *:80>
ServerAdmin admin@example.com
DocumentRoot /var/www/html/wordpress
ServerName ```<server_ip>```
<Directory /var/www/html/wordpress/>
Options FollowSymLinks
AllowOverride All
Require all granted
</Directory>
ErrorLog ${APACHE_LOG_DIR}/error.log
CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>

:wq! save and exit
```
enable the virtual host and the rewrite module
```
sudo a2ensite wordpress.conf
sudo systemctl reload apache2
sudo a2enmod rewrite
sudo systemctl restart apache2
```
in the browser</br>
http://server_ip

