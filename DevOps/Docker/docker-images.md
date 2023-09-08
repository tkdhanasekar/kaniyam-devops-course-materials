### docker pull images from dockerhub

creating app4 from Docker file

create directory grapes and navigate to the directory
```
$ mkdir grapes && cd grapes
```
create the Dockerfile
```
$ vim Dockerfile
```
```
FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y
RUN apt-get install apache2 -y
RUN apt-get install apache2-utils -y
RUN apt-get clean
COPY index.html /var/www/html/
COPY grapes.jpg /var/www/html/
EXPOSE 80
CMD ["apache2ctl","-D","FOREGROUND"]
```
create the index.html file
```
$ vim index.html
```
```
<!DOCTYPE html>
<html>
<head>
<style>
body {
  background-image: url('apple.jpg');
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: 100% 100%;
}
</style>
</head>
<body>
</body>
</html>
```
download the grapes.jpg file
```
wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1KoCwPAuby8o3tQYvk4BuuhlQ7x6M371I' -O grapes.jpg
```
the folder will have the 3 files
```
$ ls
grapes.jpg Dockerfile index.html
```
build the Dokcerfile
```
$ docker build -t apple .
```
run the docker container in detached mode
```
$ docker run -d --name grapes_app -p 8083:80 grapes
```
check with
```
$ docker ps
```
access the grapes_app with
```
http://server_ip:8083
```
