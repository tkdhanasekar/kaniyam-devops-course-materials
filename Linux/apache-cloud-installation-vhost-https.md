## Apache cloud installation , name based vhost , lets encrypt ssl certificate

step 1:

install apache2 , status check and enable apache2
```
sudo apt install apache2
sudo systemctl status apache2
sudo systemctl enable apache2
```

step 2:
Create a Directory Structure
```
sudo mkdir /var/www/html/apple.hashlabs.in
sudo mkdir /var/www/html/banana.hashlabs.in
```
step 3:
Create index.html for first site apple.hashlabs.in
```
sudo vim /var/www/html/apple.hashlabs.in/index.html
```
```
<html>
<title>apple.example.com</title>
<h1>Welcome to apple Website</h1>
</html>
:wq! save and exit
```
create index.html for second site banana.hashlabs.in
```
sudo vim /var/www/html/banana.hashlabs.in/index.html
```
```
<html>
<title>banana.hashlabs.in</title>
<h1>Welcome to banana Website</h1>
</html>
:wq!
```
step 4:
set ownership to apache user
```
sudo chown -R www-data:www-data /var/www/html/apple.hashlabs.in
sudo chown -R www-data:www-data /var/www/html/banana.hashlabs.in
```
step 5:
create a virtual host configuration file for 1st site apple.hashlabs.in
```
sudo vim /etc/apache2/sites-available/apple.hashlabs.in.conf
```
```
<VirtualHost *:80>
ServerAdmin admin@apple.hashlabs.in
ServerName apple.hashlabs.in
DocumentRoot /var/www/html/apple.hashlabs.in
DirectoryIndex index.html
ErrorLog ${APACHE_LOG_DIR}/apple.hashlabs.in_error.log
CustomLog ${APACHE_LOG_DIR}/apple.hashlabs.in_access.log combined
</VirtualHost>
:wq! save and exit
```

create a virtual host configuration file for 2nd site banana.hashlabs.in
```
sudo vim /etc/apache2/sites-available/banana.hashlabs.in.conf
```
```
<VirtualHost *:80>
ServerAdmin admin@banana.hashlabs.in
ServerName banana.hashlabs.in
DocumentRoot /var/www/html/banana.hashlabs.in
DirectoryIndex index.html
ErrorLog ${APACHE_LOG_DIR}/banana.hashlabs.in_error.log
CustomLog ${APACHE_LOG_DIR}/banana.hashlabs.in_access.log combined
</VirtualHost>
:wq! save and exit
```
step 6:
enable the virtual host configuration file
```
sudo a2ensite apple.hashlabs.in
sudo a2ensite banana.hashlabs.in
```
step 7:
update A records in DNS management of your domain (here godaddy)

step 8:
Install SSL certificate for the sites
```
sudo snap install snapd
sudo systemctl restart snapd
sudo snap install --classic certbot
ln -s /snap/bin/certbot /usr/bin/certbot
sudo certbot --apache
sudo certbot renew
```
now access the sites</br>
https://apple.hashlabs.in</br>
and</br>
https://banana.hashlabs.in
