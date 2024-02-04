## mediawiki docker-compose file

create folder mediawiki
```
mkdir mediawiki && cd mediawiki
```
create a file docker-compose.yml
```
vim docker-compose.yml
```
```
# MediaWiki with MariaDB

version: '3'
services:
  mediawiki:
    image: mediawiki
    restart: always
    ports:
      - 8089:80
    links:
      - database
    volumes:
      - images:/var/www/html/images
  database:
    image: mariadb
    restart: always
    environment:
      MYSQL_DATABASE: my_wiki
      MYSQL_USER: wikiuser
      MYSQL_PASSWORD: example
      MYSQL_RANDOM_ROOT_PASSWORD: 'yes'
    volumes:
      - db:/var/lib/mysql

volumes:
  images:
  db:
```

To start the mediawiki application container
```
$ docker-compose up -d
```
To stop the mediawiki application container
```
$ docker-compose down
```
access in browser
```
http://server_ip:8089
```

