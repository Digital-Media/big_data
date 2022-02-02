# Get Access to MongoDB

## Cloud

[Get free Tier on MongoDB Atlas](https://docs.atlas.mongodb.com/tutorial/deploy-free-tier-cluster/)

## Use Docker Container

Open Powershell or other Terminal.

### Manage Container on your own.

If you want to manage your Container and add a Dockerfile or docker-compose.yml
- `cd <path-to-Docker>`
- `mkdir mongodb`
- `cd mongodb`
- create Dockerfile and docker-compose.yml here.

### Use Docker Desktop

See installation of Docker Desktop in this [Installation Guide](https://github.com/Digital-Media/fhooe-web-dock/blob/main/INSTALL.md#install-docker)
You can adapt the steps there for your needs. The Download Link for Docker Desktop and how to install it is also there.

### Get the official MongoDB Docker image
```shell
docker pull mongo
```
