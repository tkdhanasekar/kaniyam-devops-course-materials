To encrypt a password
```
sudo apt install sshpass gnupg2
```
create hidden empty file
```
touch .secrets
```
add password in hidden file
```
$ vim .secrets
passcode123
:wq!
```
encrypt the password
```
gpg -c .secrets
```
