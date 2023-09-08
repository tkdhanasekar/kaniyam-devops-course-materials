## app7

### creating app7 from Docker file

create directory bolt and navigate to the directory
```
$ mkdir bolt && cd bolt
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
COPY bolt.jpg /var/www/html/
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
  background-image: url('bolt.jpg');
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

keep the image bolt.jpg in the same folder
```
wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1yCUsK1YCikEgOOwQNyDX-aUdVFwaayVu' -O bolt.jpg
```
the folder will have the 3 files
```
$ ls
bolt.jpg  Dockerfile  index.html
```
build the Dokcerfile
```
$ docker build -t bolt .
```
run the docker container in detached mode
```
$ docker run -d --name bolt_app -p 8080:80 bolt
```
check with 
```
$ docker ps
```
access the bolt_app with
```
http://server_ip:8080
```



