# Get Access to an ELK Stack

## Use ELK Docker Containers

### Use Docker Desktop

For a Download Link and how to install Docker Desktop see [Installation Guide](https://github.com/Digital-Media/fhooe-web-dock/blob/main/INSTALL.md#install-docker)

### Get the official MongoDB Docker image

Open Powershell or other Terminal.

```shell
docker pull elasticsearch
```
```shell
docker pull kibana
```
```shell
docker pull logstash
```


### Manage Container on your own.

If you want to manage your Container and add a Dockerfile or docker-compose.yml
- `cd <path-to-Docker>`
- `mkdir elk-stack`
- `cd elk-stack`
- create Dockerfile and docker-compose.yml here.
- Follow further steps in this [Installation Guide](https://github.com/Digital-Media/fhooe-web-dock/blob/main/INSTALL.md#install-docker)
  to manage a Docker Container. 



