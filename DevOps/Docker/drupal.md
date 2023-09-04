## drupal docker-compose file

create folder drupal
```
mkdir drupal && cd drupal
```
create a file docker-compose.yml
```
vim docker-compose.yml
```
```
# Drupal with PostgreSQL

# During initial Drupal setup,
# Database type: PostgreSQL
# Database name: postgres
# Database username: postgres
# Database password: example
# ADVANCED OPTIONS; Database host: postgres

version: '3.1'

services:

  drupal:
    image: drupal:8-apache
    ports:
      - 8090:80
    volumes:
      - /var/www/html/modules
      - /var/www/html/profiles
      - /var/www/html/themes
      # this takes advantage of the feature in Docker that a new anonymous
      # volume (which is what we're creating here) will be initialized with the
      # existing content of the image at the same location
      - /var/www/html/sites
    restart: always

  postgres:
    image: postgres:10
    environment:
      POSTGRES_PASSWORD: example
    restart: always
```

To start the drupal application container
```
$ docker-compose up -d
```
To stop the drupal application container
```
$ docker-compose down
```
access in browser
```
http://server_ip:8090
```

