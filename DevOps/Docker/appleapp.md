## app1

### creating app1 from Docker file

create directory apple and navigate to the directory
```
$ mkdir apple && cd apple
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
COPY apple.jpg /var/www/html/
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
:wq! save and exit

keep the image apple.jpg in the same folder
the folder will have the files
```
$ ls
apple.jpg  Dockerfile  index.html
```
build the Dokcerfile
```
$ docker build -t apple .
```
run the docker container in detached mode
```
$ docker run -d --name apple_app -p 8080:80 apple
```
check with 
```
$ docker ps
```
access the apple_app with
```
http://server_ip:8080
```



