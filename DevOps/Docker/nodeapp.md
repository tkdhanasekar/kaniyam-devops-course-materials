### Dockerfile for NodeJs application

create a directory node
```
mkdir node && cd node
```
Create a sample NodeJs application via the Express framework.
```
npm init
```

add the Express framework as the first dependency
```
npm i express -s
```
create a server_init.js file with simple http server
```
vim server_init.js
```
```
// Load express module using `require` directive
let express = require('express')
let app = express()

// Define request response in root URL (/)
app.get('/', function (req, res) {
res.send('Dockerize the node app')
})

// Launch listening server on port 8081
app.listen(8081, function () {
console.log('app listening on port 8081')
})
```
run the application
```
node server_init.js
```
```
http://localhost:8081
```
create the Dockerfile
```
vim Dockerfile
```
```
FROM node:18.16-alpine
RUN mkdir node
COPY . ./node
WORKDIR ./node/
RUN npm install
EXPOSE 8081
CMD node server_init.js
```
create the image
```
docker build -t hello-world .
```
check with
```
docker images
```
run the container
```
docker run -d --name node_app -p 8082:8081 hello-world
```
```
docker ps -a
```
access the app
```
http://server_ip:8082
```



