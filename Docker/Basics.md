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
```
docker run --name <container_name> <image_name>
```
```
docker run --name myapp nginx:latest
```
**List docker images**
```
docker images
```
