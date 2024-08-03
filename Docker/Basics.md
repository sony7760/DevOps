## Docker Basic Commands

**Print docker container runtime version**
```
docker --version
```
**Print help**
```
docker --help
```
**List running containers**
```
docker ps
```
**List all containers**(includes stopped)
```
docker ps -a
```
**Run a docker container**

Syntax:
```
docker run --name <container_name> <image_name>
```
Example:
```
docker run --name myapp nginx:latest
```
**Delete a container**

Syntax:
```
docker rm <container_name> OR <container_id>
```
Example:
```
docker rm myapp
```
**List docker images**
```
docker images
```
**Delete docker image**
```
docker rmi <image_name> or <image_id>
```

#### References:
- Cheat Sheet: https://docs.docker.com/get-started/docker_cheatsheet.pdf
