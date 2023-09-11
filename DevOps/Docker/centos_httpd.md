### httpd webserver on centos7

create the httpd folder
```
mkdir httpd && cd httpd
```
create the Dockerfile
```
vim Dockerfile
```
```
FROM centos:7
RUN yum update -y
RUN yum install httpd -y
COPY index.html /var/www/html/
ENTRYPOINT ["/usr/sbin/httpd","-D","FOREGROUND"]
```

create the index.html file
```
vim index.html
```
```
<h1>Hello httpd centos </h1>
```

build the image
```
docker build -t httpd .
```
```
docker images
```

run the container
```
docker run -d --name centos_httpd -p 8089:80 httpd
```
```
docker ps -a
```
access the app
```
httpd://ip:8089
```
