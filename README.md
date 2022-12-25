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
## Tekton stuff
- Install Tekton Hub Tasks
  - git-clone
  - buildah
  - kubernetes-actions

- Modify GitHub Account Name, Repo Name (as needed)
- Modify DockerHub Account Name, Repo Name (as needed)

### Docker Image for kubernetes-actions
- Could not find any image with `kubectl`
- Using AWS ECR Public Gallery - AmazonLinux ARM64
  - Script installs kubectl

### Prerequisites
- Create `ConfigMap` from your Kubernetes config
- Create `Secret` for your Git Credentials. Should have:
  - .gitconfig
  - .git-credentials
- Create `Secret` and `ServiceAccount` for dockerhub credentials
- Create `Role` and `RoleBinding`

### Deployment
- Create `Pipeline`
- Create `PipelineRun`
- Watch Pods