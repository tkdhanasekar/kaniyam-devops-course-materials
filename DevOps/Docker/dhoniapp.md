## app6

### creating app6 from Docker file

create directory dhoni and navigate to the directory
```
$ mkdir dhoni && cd dhoni
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
COPY dhoni.jpg /var/www/html/
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
  background-image: url('dhoni.jpg');
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

keep the image dhoni.jpg in the same folder
```
wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1UX0FE8VM0e5SvppfD6wKrBYz4fpbLa1L' -O dhoni.jpg
```
the folder will have the 3 files
```
$ ls
dhoni.jpg  Dockerfile  index.html
```
build the Dokcerfile
```
$ docker build -t dhoni .
```
run the docker container in detached mode
```
$ docker run -d --name dhoni_app -p 8085:80 dhoni
```
check with 
```
$ docker ps
```
access the dhoni_app with
```
http://server_ip:8085
```



