## Apache installation

install apache in ubuntu
```
sudo apt install apache2 -y
```
status check, enable apache2
```
sudo systemctl status apache2
sudo systemctl enable apache2
```

check in browser

http://127.0.0.1<br/> 
or<br/>
http://localhost

change the content in index.html
```
sudo rm /var/www/html/index.html
```
add new index.html
```
sudo vim /var/www/html/index.html
```
```
<h1>Welcome to kaniyam</h1>
:wq!
```

make a domain point to your server
open /etc/hosts file
```
sudo vim /etc/hosts
```
```
127.0.0.1 testpage.com
:wq! save and exit
```
restart the server
```
sudo systemctl restart apache2
```
in browser</br>
http://testpage.com

