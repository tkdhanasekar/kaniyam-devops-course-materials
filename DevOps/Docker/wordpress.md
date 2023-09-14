## wordpress docker-compose file

create folder wordpress
```
mkdir wordpress && cd wordpress
```
create a file docker-compose.yml
```
vim docker-compose.yml
```
```
version: "3"
services:
  wordpress:
    container_name: my_wordpress
    image: wordpress
    ports:
      - "8080:80"
    links:
      - mysql
    environment:
      WORDPRESS_DB_HOST: mysql
      WORDPRESS_DB_USER: root
      WORDPRESS_DB_PASSWORD: "12345"
      WORDPRESS_DB_NAME: wordpress
  mysql:
    container_name: my_mysql
    image: "mysql:5.7"
    volumes:
      - ./.mysql:/var/lib/mysql
    environment:
      MYSQL_DATABASE: wordpress
      MYSQL_ROOT_PASSWORD: "12345"
```
To validate the docker-compose.yml
```
docker-compose -f docker-compose.yml config
```

To start the wordpress application container
```
$ docker-compose up -d
```
To stop the wordpress application container
```
$ docker-compose down
```
access in browser
```
http://server_ip:8087
```
To access phpmyadmin
```
http://server_ip:8088
```


