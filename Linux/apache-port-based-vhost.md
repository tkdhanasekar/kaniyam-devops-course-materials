## Apache port based vhost
install apache
```
sudo apt install apache2
sudo systemctl status apache2
sudo systemctl enable apache2
```

edit the ports.conf file
```
sudo vim /etc/apache2/ports.conf
```
```
Listen 8080
Listen 8081
:wq! save and exit
```
create the directories
```
sudo mkdir /var/www/html/8080
sudo mkdir /var/www/html/8081
```

create the index.html for two sites
```
sudo vim /var/www/html/8080/index.html
```
```
<html>
<title>8080</title>
<h1>Welcome to Tea Website running on port 8080</h1>
</html>
:wq! save and exit
```
```
sudo vim /var/www/html/8081/index.html
```
```
<html>
<title>8081</title>
<h1>Welcome to Coffee Website running on port 8081</h1>
</html>
:wq! save and exit
```

change the file ownership and group ownership to apache user www-data
```
sudo chown -R www-data:www-data /var/www/html/8080
sudo chown -R www-data:www-data /var/www/html/8081
```

create the virtual host file for site1
```
sudo vim /etc/apache2/sites-available/8080.conf
```
```
<VirtualHost <server_ip>:8080>
ServerAdmin admin@myserver.hashlabs.in
ServerName  myserver.hashlabs.in
DocumentRoot /var/www/html/8080
DirectoryIndex index.html
ErrorLog ${APACHE_LOG_DIR}/8080_error.log
CustomLog ${APACHE_LOG_DIR}/8080_access.log combined
</VirtualHost>
:wq! save and exit
```
```
sudo vim /etc/apache2/sites-available/8081.conf
```
```
<VirtualHost <server_ip>:8081>
ServerAdmin admin@myserver.hashlabs.in
ServerName  myserver.hashlabs.in
DocumentRoot /var/www/html/8081
DirectoryIndex index.html
ErrorLog ${APACHE_LOG_DIR}/8081_error.log
CustomLog ${APACHE_LOG_DIR}/8081_access.log combined
</VirtualHost>
```

enable the virtual host
```
sudo a2ensite 8080
sudo a2ensite 8081
```
restart the service
```
sudo systemctl restart apache2
```
access the sites
http://myserver.hashlabs.in:8080</br>
and</br>
http://myserver.hashlabs.in:8081</br>
&nbsp;
&nbsp;
**Note:** in server_ip give your server ip address</br>
          in place of myserver.hashlabs.in give your domain name


