## app2

### creating app2 from Docker file

create directory banana and navigate to the directory
```
$ mkdir banana && cd banana
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
COPY banana.jpg /var/www/html/
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
  background-image: url('banana.jpg');
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

keep the image banana.jpg in the same folder
```
$ wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1dzZDaEO99ZweDb-PIyfkdQ_DuChHUvl0' -O banana.jpg
```
the folder will have the 3 files
```
$ ls
banana.jpg  Dockerfile  index.html
```
build the Dokcerfile
```
$ docker build -t banana .
```
run the docker container in detached mode
```
$ docker run -d --name banana_app -p 8081:80 banana
```
check with 
```
$ docker ps
```
access the banana_app with
```
http://server_ip:8081
```



