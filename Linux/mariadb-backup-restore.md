## MariaDB Backup and Restore

In order to back up and later restore your database, binary log must be enabled.
```
sudo vim /etc/mysql/mariadb.conf.d/50-server.cnf
```
uncomment the line
```
log_bin     = /var/log/mysql/mysql-bin.log
:wq! save and exit
```
```
sudo systemctl restart mariadb.service
```
binary log is enabled.


### Backing Up a Single Database
backup db AAA
```
mysqldump -u root -p AAA > AAA.sql
```
delete the database AAA
```
mysql -u root -p
> drop database AAA;
> exit;
```
now restore the database
```
mysql -u root -p
> create database AAA;
> exit;
```
restore the backup to your database
```
mysql -u root -p AAA < AAA.sql
```


### Backing Up Multiple Databases
backup db AAA and BBB
```
mysqldump -u root -p --databases AAA BBB > AB.sql
```
delete the database AAA BBB
```
> mysql -u root -p
> drop database AAA;
> drop database BBB;
> exit;
```
now restore the database
```
mysql -u root -p
> create database AAA;
> create database BBB;
> exit;
```
restore the backup to your databases
```
mysql -u root -p < AB.sql
```

### Backing up all databases
backup all db
```
mysqldump -u root -p --all-databases > all-databases.sql
```
delete all databases AAA BBB CCC
```
mysql -u root -p
> drop database AAA;
> drop database BBB;
> drop database CCC;
> exit;
```
restore
```
mysql -u root -p < all-databases.sql
```

### with time stamp backup
```
mysqldump -u root -p AAA > AAA_`date +"%Y-%B-%d_%R"`.sql
```

### with Compression
```
mysqldump -u root -p AAA | gzip > AAA.sql.gz
gzip -d AAA.sql.gz
```
delete the AAA db
```
mysql -u root -p
> drop database AAA;
> exit;
```
restore the AAA.sql
```
mysql -u root -p < AAA.sql
```

