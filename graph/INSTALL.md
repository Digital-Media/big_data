# Get Access to Neo4J

## Cloud

For Neo4J you can use its free [AuraDB](https://neo4j.com/cloud/aura/).
It can be used for free for ever and upgraded to max 128 GB.

## Desktop

Alternatively you can download the [Desktop Version](https://neo4j.com/download-neo4j-now/).

# Get Access to PostgreSQL

## PostgreSQL Sandbox

[free online version](https://www.katacoda.com/enterprisedb/scenarios/pgadmin-sandbox).
Note that the database is reset at each logout.

## Use a PostgreSQL Docker Container

### Use Docker Desktop

For a Download Link and how to install Docker Desktop see [Installation Guide](https://github.com/Digital-Media/fhooe-web-dock/blob/main/INSTALL.md#install-docker)

### Get the official PostgreSQL:v14 Docker image

Open Powershell or other Terminal.

```shell
docker pull postgres:14
```
### Run a Container
```shell
docker run --name PostgreSQL -e POSTGRES_PASSWORD=geheim -d postgres:14
```
#### Get access to the container
Either use Docker Desktop and the Shell-Button or run
```shell
docker exec -it PostgreSQL /bin/bash
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


