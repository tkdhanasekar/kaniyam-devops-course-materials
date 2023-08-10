## ssh pasword and passwordless login using ssh-keygen

To install ssh
```
sudo apt install openssh-server openssh-client
```

To check the status of the sshd service
```
sudo systemctl status sshd.service
```

To enable the sshd service
```
sudo systemctl enable sshd.service
```

To connect to a remote machine using ssh
```
ssh root@<server_ip>
```

To connect to a remote server by username
```
ssh username@<server_ip>
```

To disable the root user login in ssh,
In remote ssh server
```
$ sudo vim /etc/ssh/sshd_config
```
change the parameter from
```
PermitRootLogin yes
to
PermitRootLogin no

:wq! save and exit
```
restart the service
```
sudo systemctl restart sshd.service
```

To make your local machine to login to ssh server passwordless using ssh keys
create ssh keys in your local machine
```
kaniyam@localhost:~$ ssh-keygen
Generating public/private rsa key pair.
Enter file in which to save the key (/home/kaniyam/.ssh/id_rsa):
Created directory '/home/kaniyam/.ssh'.
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in /home/kaniyam/.ssh/id_rsa
Your public key has been saved in /home/kaniyam/.ssh/id_rsa.pub
The key fingerprint is:
SHA256:JSRYsswlKrV+J91HKiLz4H4G6wap091tmfDHGcLjSfw kaniyam@localhost
The key's randomart image is:
+---[RSA 3072]----+
|  . oo+ .        |
| . =.= o         |
|. o +   . o      |
| o   . . =       |
| .= + +oS .      |
|o..* +..*..      |
|.o.+.. * O o     |
|o.+ + . O E      |
| +oo   . .       |
+----[SHA256]-----+
```
The public ssh key will be stored in /home/<username>/.ssh/id_rsa.pub
in your machine

we have to copy the public to remote ssh server to login passwordless
```
$ ssh-copy-id -i ~/.ssh/id_rsa.pub username@<remote_ssh_server_ip>
```
in the remote ssh server your public key will be stored in the location
```
$ cd ~/.ssh/
$ ls
$ cat authorized_keys
```


To make the ssh login to customised port 2222 instead of default port 22
```
$ sudo vim /etc/ssh/sshd_config
```
```
uncomment the line
#Port 22
to
Port 2222
:wq! save and exit
```
restart the service
```
sudo systemctl restart sshd.service
```

The best practice to login to remote servers using ssh without password
```
$ ssh username@<remote_server_ip> -p 2222
```
- disable root login
- change the default port to customised port to login
- login using ssh public keys without password
