## mariadb

- install mariadb
- create root password for mariadb
- create database
- create tables
- insert, view, filter, delete records in tables
- delete database, tables
- create remote db user , password , grant privileges
- access remote db from local machine



To install mariadb , check the status , enable the service
```
sudo apt install mariadb-server mariadb-client
sudo systemctl status mariadb.service
sudo systemctl enable mariadb.service
```
To configure mariadb root password
```
mysql_secure_installation
```
```
Enter current password for root (enter for none): ENTER

You already have your root account protected, so you can safely answer 'n'.
Switch to unix_socket authentication [Y/n] n

Change the root password? [Y/n] Y
New password:
Re-enter new password:

Remove anonymous users? [Y/n] Y

Disallow root login remotely? [Y/n] Y

Remove test database and access to it? [Y/n] Y

Reload privilege tables now? [Y/n] Y
```
To login to mariadb
```
mysql -u root -p
```
```
MariaDB [(none)]>
```
To view databases
```
MariaDB [(none)]> show databases;
```
To create database AAA, BBB, CCC, testdb
```
MariaDB [(none)]> create database AAA;
MariaDB [(none)]> create database BBB;
MariaDB [(none)]> create database CCC;
MariaDB [(none)]> create database testdb;
```
To use database AAA
```
MariaDB [(none)]> use AAA;
MariaDB [AAA]>
```
To view tables in the database AAA
```
MariaDB [AAA]> show tables;
```
To create a table with name players
```
MariaDB [AAA]> CREATE TABLE players ( id INT NOT NULL AUTO_INCREMENT, name VARCHAR(100) NOT NULL, sports
VARCHAR(50), PRIMARY KEY(id) );
```
To create single record in table players
```
MariaDB [AAA]> INSERT INTO players (id, name, sports) VALUES ('1', 'Dhoni', 'cricket');
```
To create multiple records in table players
```
MariaDB [AAA]> INSERT INTO players (id, name, sports) VALUES ('2', 'Rohit', 'cricket'),('3', 'kohli', 'cricket'),('4', 'federer', 'tennis'),('5', 'ronaldo', 'football');
```
To view the record created in table players
```
MariaDB [AAA]> select * from players;
```
To view a particular record from the table players
```
MariaDB [AAA]> select * from players where id=2;
MariaDB [AAA]> select * from players where name='dhoni';
```
To delete a particular record from the table players
```
MariaDB [AAA]> DELETE FROM players where id=3;
MariaDB [AAA]> DELETE FROM players where name='ronaldo';
```
To delete a table players
```
MariaDB [AAA]> drop table table_name;
MariaDB [AAA]> drop table players
```
To delete a database AAA
```
MariaDB [AAA]> drop database db_name;
MariaDB [AAA]> drop database AAA;
```


To access a remote database , create a user myuser and password for the user, grant all privileges
```
mysql -u root -p
MariaDB [(none)]> CREATE DATABASE mydb;
MariaDB [(none)]> CREATE USER 'myuser'@'%' IDENTIFIED BY 'kan123';
MariaDB [(none)]> GRANT ALL PRIVILEGES ON *.* TO 'myuser'@'%';
MariaDB [(none)]> flush privileges;
MariaDB [(none)]> exit;
```
edit the config file bind address from 127.0.0.1 to 0.0.0.0
```
vim /etc/mysql/mariadb.conf.d/50-server.cnf
bind-address            = 0.0.0.0
:wq!
```

From your local machine
```
$ mysql -u myuser -p -h <remote_dbserver_ip>
MariaDB [(none)]>
```






