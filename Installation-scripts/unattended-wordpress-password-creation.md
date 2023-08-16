### unattended wp password
```
vim .secrets
passcode
```
:wq! save and exit

encrypt the password using gpg
```
gpg -c .secrets
```
give passphrase
confirm passphrase

