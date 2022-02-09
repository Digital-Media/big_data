# Get Access to an ELK Stack

## Use ELK Docker Containers

### Use Docker Desktop

For a Download Link and how to install Docker Desktop see [Installation Guide](https://github.com/Digital-Media/fhooe-web-dock/blob/main/INSTALL.md#install-docker)

### Get the official ELK Docker images

Open Powershell or other Terminal.
Note that tag `latest` is not supported.

```shell
docker pull elasticsearch:7.17.0
```
```shell
docker pull kibana:7.17.0
```
```shell
docker pull logstash:7.17.0
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

Now you can access ElasticSearch with [Kibana http:\\localhost:5601](http:\\localhost:5601)

### Starting full ELK-Stack and use Logstash

Use the provided docker-compose.yml

### Getting FileBeat

See [Elastic Documentation](https://www.elastic.co/guide/en/beats/filebeat/current/running-on-docker.html)

```shell
docker pull store/elastic/filebeat:7.17.0
```
```shell
docker run docker.elastic.co/beats/filebeat:7.17.0 setup -E setup.kibana.host=kibana:5601 -E output.elasticsearch.hosts=["elasticsearch:9200"]
```