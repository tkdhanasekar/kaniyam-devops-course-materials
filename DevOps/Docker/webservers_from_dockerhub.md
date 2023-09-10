### ubuntu apache2 and nginx webserver containers out of images from docker hub

creating ubuntu apache webserver container out of image ubuntu/apache2 from docker hub
```
docker pull ubuntu/apache2
```
```
docker images
```
```
docker run -d --name apache_demo2 -p 8086:80 ubuntu/apache2
```
```
docker ps -a
```
access in browser
```
http://ip:8086

or
localhost:8086
```

creating ubuntu nginx webserver container out of image ubuntu/nginx from docker hub
```
docker pull ubuntu/nginx
```
```
docker images
```
```
docker run -d --name nginx_demo -p 8087:80 ubuntu/nginx
```
```
docker ps -a
```
access in browser
```
http://ip:8087
or
localhost:8087
```
