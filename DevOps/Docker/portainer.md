## portainer

create volume for portainer
```
docker volume create portainer_data
```
```
docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce
```
check for portainer container
```
docker ps
```
```
http://ip:9000
```
