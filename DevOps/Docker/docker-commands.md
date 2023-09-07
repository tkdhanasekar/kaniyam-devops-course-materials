### docker commands

To view docker commands help
```
$ docker --help
```

To view docker-compose help
```
$ docker-compose --help
```
To pull different linux images from docker public
repository
```
$ docker pull ubuntu
$ docker pull debian
$ docker pull centos
$ docker pull fedora
$ docker pull alpine
```
To view the images in docker host
```
$ docker images
```
To search and pull apache2 image from public docker hub
```
$ docker search apache2
$ docker pull ubuntu/apache2
```
To search and pull nginx image from public docker hub
```
$ docker search nginx
$ docker pull nginx
```
To view images
```
$ docker images
```
To make apache container out of ubuntu/apache2 image
```
$ docker run -d --name kaniyam_apache -p 8080:80 ubuntu/apache2
```
To make nginx container out of nginx image
```
$ docker run -d --name kaniyam_nginx -p 8081:80 nginx
```
To view the containers creates
```
$ docker container ls
or
$ docker ps
```
To enter into bash mode of containers
```
$ docker exec -it <container_name/id> /bin/bash
```
To enter into bash mode of kaniyam_nginx container
```
$ docker exec -it kaniyam_nginx /bin/bash
```
To enter into bash mode of kaniyam_apache container
```
$ docker exec -it kaniyam_apache /bin/bash
```
To exit out of the container 
```
root@<container_id>:/# exit
```
To stop a container 
```
$ docker stop <container_name>
or
$ docker stop <container_id>
```
To start a stopped container again
```
$ docker start <container_name>
or
$ docker start <container_id>
```
To pause a running container
```
$ docker pause <container_name>
or
$ docker pause <container_id>
```
To unpause a running container
```
$ docker unpause <container_name>
or 
$ docker unpause <container_id>
```
To remove a container 
```
$ docker stop <container_id/name>
$ docker rm <container_id/name>
```
To remove a image
first stop container which is using the image
```
$ docker rmi <image_id/name>
```
To remove a image forcefully
```
$ docker rmi --force <image_id/name>
```
To view all containers stopped , paused , exited , running
```
$ docker ps -a
```
To Display system-wide information
```
$ docker info
or
$ docker system info
```
To view which port container is using
```
$ docker port <container_name/id>
$ docker port kaniyamapache
```








