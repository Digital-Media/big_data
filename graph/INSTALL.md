# Get Access to Neo4J

## Cloud

For Neo4J you can use its free [AuraDB](https://neo4j.com/cloud/aura/).
It can be used for free for ever and upgraded to max 128 GB.

## Desktop

Alternatively you can download the [Desktop Version](https://neo4j.com/download-neo4j-now/).

# Get Access to PostgreSQL

## Use a PostgreSQL Docker Container

### Use Docker Desktop

For a Download Link and how to install Docker Desktop see [Installation Guide](https://github.com/Digital-Media/fhooe-web-dock/blob/main/INSTALL.md#install-docker)

#### Add PostgreSQL and a web tool for administration

[See Digital-Media Repo](https://github.com/Digital-Media/postgres)

With Docker Desktop there is a *PGAdmin4* extension available.
Use `host.docker.internal:5432` to connect to the local postgres container.

### Just get the official PostgreSQL:v14 Docker image

Open Powershell or other Terminal.

```shell
docker pull postgres:14
```
### Run a Container
Can't be done with Docker Desktop, because -e is not supported in Optional Settings in RUN menu.
```shell
docker run --name PostgreSQL -e POSTGRES_PASSWORD=geheim -d postgres:14
```
#### Get access to the container
Either use Docker Desktop and the Shell-Button or run
```shell
docker exec -it PostgreSQL /src/bash
```
#### Stop Container
```shell
docker container stop PostgreSQL
```
#### Start Container
```shell
docker container start PostgreSQL
```

### Manage Container on your own.

If you want to manage your Container and add a Dockerfile or docker-compose.yml
- `cd <path-to-Docker>`
- `mkdir postgres`
- `cd postgres`
- create Dockerfile and docker-compose.yml here.
- Follow further steps in this [Installation Guide](https://github.com/Digital-Media/fhooe-web-dock/blob/main/INSTALL.md#install-docker)
  to manage a Docker Container. 

