# Get Access to an ELK Stack

## Use ELK Docker Containers

### Use Docker Desktop

For a Download Link and how to install Docker Desktop see [Installation Guide](https://github.com/Digital-Media/fhooe-web-dock/blob/main/INSTALL.md#install-docker)

### Get the official ELK Docker images

Open Powershell or other Terminal.
Note that tag `latest` is not supported.

```shell
docker pull elasticsearch
```
```shell
docker pull kibana
```
```shell
docker pull logstash
```


### Starting ElasticSearch

```shell
docker network create big_data
```

```shell
docker run -d --name elasticsearch --net big_data -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" elasticsearch:7.17.0
```

You can access ElasticSearch [in a browser](http:\\localhost:9200)

### Using Kibana

```shell
docker run -d --name kibana --net big_data -p 5601:5601 kibana:7.17.0
```

Now you can access ElasticSearch with [Kibana http:\\localhost:9200](http:\\localhost:9200)

### Starting full ELK-Stack and use Logstash

Use the provided docker-compose.yml