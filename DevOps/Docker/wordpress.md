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
version: '3.9'

services:
  mysql:
    image: mysql:8.0
    volumes:
      - mysql_data:/var/lib/mysql
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: root
      MYSQL_DATABASE: wordpress
      MYSQL_USER: wordpress
      MYSQL_PASSWORD: wordpress
    

  phpmyadmin:
    image: phpmyadmin/phpmyadmin
    depends_on:
      - mysql
    environment:
      PMA_HOST: mysql
      PMA_PORT: 3306
      PMA_ARBITRARY: 1
    restart: always
    ports:
      - 8088:80

  wordpress:
    depends_on:
      - mysql
    image: wordpress:latest
    ports:
      - "8087:80"
    restart: always
    environment:
      WORDPRESS_DB_HOST: mysql:3306
      WORDPRESS_DB_USER: wordpress
      WORDPRESS_DB_PASSWORD: wordpress
      WORDPRESS_DB_NAME: wordpress
    volumes:
      - ./wordpress:/var/www/html

volumes:
  mysql_data: {}


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

