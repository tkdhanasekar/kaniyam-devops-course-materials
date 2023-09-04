The legacy builder is deprecated and will be removed in a future release.
            Install the buildx component to build images with BuildKit:
            https://docs.docker.com/go/buildx/
       
update the system
```     
sudo apt-get update
```
install dependencies
```
sudo apt-get install ca-certificates curl gnupg -y
```
Add Docker's official GPG key
```
sudo install -m 0755 -d /etc/apt/keyrings
```
```
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
```
```
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```
update
```
sudo apt-get update
```
install dokcer docker-plugins
```
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```
install docker-compose plugin
```
curl -L "https://github.com/docker/compose/releases/download/v2.21.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
```
```
ls -lsh /usr/local/bin/docker-compose
```
```
chmod +x /usr/local/bin/docker-compose
```
```
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
```
check the versions
```
docker version && docker compose version && docker-compose version
```
docker restart , enable , status check
```
sudo systemctl restart docker && sudo systemctl enable docker && sudo systemctl status docker --no-pager -l
```

To remove docker and docker plugins
```
sudo apt-get purge docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-ce-rootless-extras
sudo rm -rf /var/lib/docker
sudo rm -rf /var/lib/containerd
```

