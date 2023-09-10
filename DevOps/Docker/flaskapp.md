### dockerizing flask app 

create flask_app folder
```
$ mkdir flask_app && cd flask_app
```
create requirements.txt
```
vim requirements.txt
```
```
flask
redis
```

create the app.py file
```
vim app.py
```
```
# compose_flask/app.py
from flask import Flask
from redis import Redis

app = Flask(__name__)
redis = Redis(host='redis', port=6379)

@app.route('/')
def hello():
    redis.incr('hits')
    return 'This Compose/Flask demo has been viewed %s time(s).' % redis.get('hits')


if __name__ == "__main__":
    app.run(host="0.0.0.0", debug=True)
    
```

Create your Dockerfile
```
vim Dockerfile
```
```
FROM python:3.10
ADD . /code
WORKDIR /code
RUN pip3 install -r requirements.txt
CMD python3 app.py
```
create docker-compose.yml
```
vim docker-compose.yml
```
```
version: '2'
services:
    web:
        build: .
        ports:
            - "5000:5000"
        volumes:
            - .:/code
        depends_on:
            - redis
    redis:
        image: redis
```

To start the container
```
docker-compose up -d
```
To stop the container
```
docker-compose down
```
access the app
```
http://server_ip:5000
```



