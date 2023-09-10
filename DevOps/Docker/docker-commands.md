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

To view the docker process status
```
docker ps -a(all)
docker ps -s(size)
```

To login to a docker container
```
docker exec -it container_name /bin/bash
```

https://hub.docker.com/
To login to dockerhub registry
```
docker login
username:
password:
```

To logout from dockerhub registry
```
docker logout
```

To push image from local to dockerhub registry
First tag the image to be pushed
then Login to dockerhub using
```
docker login
```
```
docker tag dnadna/orange-demo:v1 dnadna/orange:latest
```

then push to dockerhub
```
docker push dnadna/orange:latest
```

To pull the above image from dockerhub registry to local
```
docker pull dnddna/orange:latest
```

To stop a running container
```
docker stop <container_id>or<container_name>
```

To start a container
```
docker start <container_id>or<container_name>
```

To restart a container
```
docker restart <container_id>or<container_name>
```

To kill the container by stopping its execution immediately
```
docker kill <container_id>or<container_name>
```

To commit changes to docker image
```
docker commit [CONTAINER_ID or Name] [new_image_name]
```
or
```
docker container commit [CONTAINER_ID or Name] [new_image_name]
```

To delete a stopped container
```
docker rm <container_id>or<container_name>
```

To directly remove the container without stopping it
```
docker rm -f <container_name or container_id>
```

To delete an image from local storage
```
docker rmi <image_id>or<image_name>
```

To force delete a Docker Image
```
docker rmi -f <image_id or image_name>
```

To list the details of all the network
```
docker network ls
```

To get information about docker installed
```
docker info
```

To Copy file from a docker container to the local system
```
docker cp <containerId>:/tmp/sample.txt /home/dhana/Documents/
```

To copy file from local system to docker container
```
docker cp sample.txt container_id:/tmp
```

To show the history of a docker image
```
docker history <image_id>or<image_name>
```

To show the logs of the docker container
```
docker logs <container_id>or<container_name>
```

To search for a docker image on dockerhub
```
docker search <image_name>
```

To create a volume
```
docker volume create
or
docker volume create --name volume-name
```

To list the volumes
```
docker volume ls
```

To get Details about a Docker Volume
```
docker volume inspect <volume_name>or<volume_id>
```

To delete a volume first stop the container
```
docker volume rm <volume_name>or<volume_id>
```

To change repository name or rename image
```
docker tag repository:tag new_image_name:tag
or
docker tag image_id new_image_name:tag
```

To list networks
```
docker network ls
```

To list all the Running Containers with the File Size
```
docker container ls -s
```

To List the IDs of the Running Containers
```
docker ps -q
or
docker container ls -q
```

List the IDs of all the Containers (irrespective of the state)
```
docker ps -a -q
or
docker ps -aq
```

To Pause a running Container
```
docker pause <container_id or container_name>
or
docker container pause <container_id or container_name>
```

To Unpause a paused Container
```
docker unpause <container_id or container_name>
or
docker container unpause <container_id or container_name>
```

Listing Processes running in a Docker Container
```
docker top <container_name or container_id>
or
docker container top <container_name or container_id>
```

Rename a Docker Container
```
docker rename <old_name> <new_name>
or
docker container rename <old_name> <new_name>
```

pass any command that we want to execute inside the container
```
docker exec -it <container_name> echo "Hello, from container"
```

To list the Docker Image Ids
```
docker images -q
```

To list all the Docker Images (including dangling images)
```
docker images -a
```

To list Dangling Docker Images
```
docker images -f dangling=true
```

To get the logs of the Docker container
```
docker container logs <container_id or container_name>
```

To display the last few lines of the container logs
```
docker container logs -f <container_id or container_name>
```

To Get the last 3 lines of the Container Logs
```
docker container logs --tail 3 <container_id or container_name>
```

To get Docker Stats of the running Container
```
docker stats
```

To get Docker stats of all containers
```
docker stats --all
```

To get Detailed Info about an Object (Container, Image, Volume, etc)
```
docker inspect <name or id>
```

To get the Summary of Docker Usage
```
docker system df
```

To Show all mapped ports
```
docker port container_name
```

Exporting a container
```
docker export container_name > container_name.tar
or
docker export container_name | gzip > container_name.gz
```

Create a backup
```
docker save image_name > image_name.tar
```

To delete all the Stopped Containers
```
docker container prune
```

To remove all the Dangling Docker Images
```
docker image prune
```

To remove all the Dangling and Unused Docker Images
```
docker image prune -a
```

To Clean your Docker system
```
docker system prune
```

ctop tool to monitor docker health status
```
sudo wget https://github.com/bcicen/ctop/releases/download/v0.7.1/ctop-0.7.1-linux-amd64 -O /usr/local/bin/ctop
```
```
sudo chmod +x /usr/local/bin/ctop
```
```
ctop
```

To display active containers
```
ctop -a
```

To display CPU as % of system total
```
ctop -scale-cpu
```

Stop all the containers
```
docker stop $(docker ps -a -q)
```

Remove all the containers
```
docker rm $(docker ps -a -q)
```

To delete all containers including its volumes use
```
docker rm -vf $(docker ps -aq)
```

To delete all the images
```
docker rmi -f $(docker images -aq)
```

To prune
```
docker container prune
docker image prune
docker volume prune
docker network prune
docker system prune
```

To remove exited containers
```
docker rm $(docker ps -a -q -f status=exited)
```
