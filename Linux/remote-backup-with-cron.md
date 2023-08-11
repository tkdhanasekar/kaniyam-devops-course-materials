## Automated Remote Backup and Cron job

required package
```
sudo apt install sshpass
```
First create hidden password file from your home dir
```
touch .secrets
vim .secrets
passcode123

:wq! save and exit
```

Next create the shell script to make automated backup and send the backup files to remote server
using rsync
```
vim remote-backup.sh 
```
```
#!/bin/bash
sshpass -f ".secrets" mysqldump -u root -p --all-databases > all-databases_`date +"%Y-%B-%d_%R"`.sql
mv *.sql backup/
sshpass -f ".secrets" rsync -a backup/ kaniyam@172.105.60.91:/home/kaniyam/backup

:wq! save and exit
```

create the cron jon
```
crontab -e
```
```
# To run the script every midnight 11.55 P.M 
55 23 * * * /bin/bash /home/kaniyam/remote-backup.sh

# To run the script every 5 minutes
*/5 * * * * /bin/bash /home/kaniyam/remote-backup.sh

:wq! save and exit
```

restart the cron service
```
sudo systemctl restart cron.service
```
To list the cron jobs
```
crontab -l
```

  
```





