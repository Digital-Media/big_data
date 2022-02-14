# Get Access to an ELK Stack

## Use ELK Docker Containers

### Use Docker Desktop

For a Download Link and how to install Docker Desktop see [Installation Guide](https://github.com/Digital-Media/fhooe-web-dock/blob/main/INSTALL.md#install-docker)

### Get the official ELK Docker image

Open Powershell or other Terminal.
Note that tag `latest` is not supported.

We use the template from [gitHub](https://github.com/deviantony/docker-elk) for demonstration purposes 
```shell
git clone https://github.com/Digital-Media/elk-stack-dock.git
```
use docker compose v3.2
```shell
docker compose up -d
```
or use docker compose v3.3
```shell
docker compose -f docker-stack.yml up -d
```

### Managing ElasticSearch, Kibana, Logstash and Filebeat on your own

```shell
docker build -f Dockerfile-ELKF -t big_data_elk:ss22 .
```
```shell
docker container run --name elkf -it big_data_elk:ss22 /bin/bash
```