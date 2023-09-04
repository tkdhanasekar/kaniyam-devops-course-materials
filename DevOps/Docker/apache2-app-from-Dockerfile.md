## sample-apps

### creating ubuntu apache2 webserver container from docker file

create directory apache and navigate to the directory
```
$ mkdir apache && cd apache
```
create the Dockerfile
```
$ vim Dockerfile
```
```
FROM ubuntu
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y
RUN apt-get install apache2 -y
RUN apt-get install apache2-utils -y
RUN apt-get clean
COPY index.html /var/www/html/
EXPOSE 80
CMD ["apache2ctl","-D","FOREGROUND"]
```
create the index.html file
```
<h1> Hi this is Apache Docker Container</h1>
```
build the Dockerfile
```
$ docker build -t myapache .
```
run the docker container in detached mode
```
$ docker run -d --name apache_demo -p 8085:80 myapache
```
check with 
```
$ docker ps 
```
access the app with
```
http://server_ip:8085
```

**========================================================================**


