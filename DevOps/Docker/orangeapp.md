## app5

### creating app5 from Docker file

create directory orange and navigate to the directory
```
$ mkdir orange && cd orange
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
COPY orange.jpg /var/www/html/
EXPOSE 80
CMD ["apache2ctl","-D","FOREGROUND"]
```
:wq! save and exit

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
  background-image: url('orange.jpg');
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
:wq! save and exit

keep the image orange.jpg in the same folder
```
wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1FMBg1IU46fqWLieuzsyiFyXp3SP8Fidj' -O orange.jpg
```
the folder will have the 3 files
```
$ ls
orange.jpg  Dockerfile  index.html
```
build the Dokcerfile
```
$ docker build -t orange .
```
run the docker container in detached mode
```
$ docker run -d --name orange_app -p 8084:80 orange
```
check with 
```
$ docker ps
```
access the orange_app with
```
http://server_ip:8084
```



