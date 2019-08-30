## Docker

### Remove all unused containers, networks and images (both dangling and unreferenced)

```bash
docker system prune
```

### Delete all docker containers
 
 ```bash
 docker rm `docker ps --no-trunc -aq`
```

### Delete all docker images

 ```bash
 docker rmi -f $(docker images -q)
```

