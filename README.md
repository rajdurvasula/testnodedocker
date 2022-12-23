# testnode

Simple NodeJS application with express module including a Dockerfile

## Build Container
```
docker build -t testnodedocker:1.0 .
```

## Run Container
```
docker run --name testnodedocker --rm -p 8080:8080 -d testnodedocker:1.0
```

## Verify node app
```
curl -vvv http://localhost:8080
```

### Expected result:
```
{"message":"Welcome to sample node mysql restapi - from - <container_id>"}
```
