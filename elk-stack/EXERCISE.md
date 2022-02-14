# Exercises with a search engine

We use ElasticSearch to write Search queries and PostgreSQL to to copy data with logstash.
Filebeat is used for demonstrating how log entries can be ingested into ElasticSearch in a simpler way than with logstash.
We use Kibana as a Browser Frontend to visualize data and get easier access to ElasticSearch.

ElasticSearch is also used to show a typical BIG DATA pipeline.

## Get an ELK installation

See [INSTALL.md](https://github.com/Digital-Media/big_data/blob/main/elk-stack/INSTALL.md) for Details and Troubleshooting

## Exercises for ELK Stack

Store commands of each step in a *.txt file.

### Step 1: See a simple LogStash-Pipeline in Action
       
Open Commandline of [big_data_elk:ss22](https://github.com/Digital-Media/big_data/blob/main/elk-stack/INSTALL.md#managing-elasticsearch-kibana-logstash-and-filebeat-on-your-own)
See [Elastic Guide](https://www.elastic.co/guide/en/logstash/current/first-event.html)
1. ```shell
   docker container run --name elkf -it big_data_elk:ss22 /bin/bash
   ```
2. If you start a shell with Docker Desktop enter `bash` to use a more comfortable shell.
3. Find out where logstash is installed
4. `cd` to bin directory of logstash
5. Test a simple pipeline with input from and output to commandline. Wait until pipeline is running
   
   `[INFO ] 2022-02-14 07:56:05.167 [Agent thread] agent - Pipelines running {:count=>1, :running_pipelines=>[:main], :non_running_pipelines=>[]}`
   Then type `hello world`
7. Stop the pipeline
8. List logstash plugins with its version
9. See if jdbc-integration-plugin is installed

### Step 2: Working with LogStach jdbc and PostgreSQL

Work with logstash as shown in [Step 1](https://github.com/Digital-Media/big_data/blob/main/elk-stack/EXERCISE.md#step-1-see-a-simple-logstash-pipeline-in-action)

This is useful for testing a jdbc-connection to a database
```shell
./logstash -e 'input {
      jdbc {
      jdbc_connection_string =>     "jdbc:mysql://localhost:3306/onlineshop"
      jdbc_user => "mysql"
      jdbc_password => "geheim"
      jdbc_driver_class => "org.mysql.Driver"
      statement => "SELECT * from public.orders"
      }
      } output { stdout {} }'
```
Open a commandline

See this [medium blog](https://medium.com/@emreceylan/how-to-sync-postgresql-data-to-elasticsearch-572af15845ad)
1. Create a table in postgres. For Example: orders, visits, order_items
2. See for [Examples](https://github.com/Digital-Media/big_data/blob/main/elk-stack/examples.sql).
3. create a configuration file to get data from postgres public.orders in /etc/logstash/conf.d
4. optional: configure a pipeline in `/etc/logstash/pipelines.yml` (a default is there)

### Step 3: Adding a new module to filebeat and test it in Kibana

Get Docker-Container for Filebeats and follow Instructions in [Elastic Documentation](https://www.elastic.co/guide/en/beats/filebeat/current/running-on-docker.html)

1. Open Powershell or other terminal.
2. Get [filebeat.docker.yml](https://raw.githubusercontent.com/elastic/beats/7.17/deploy/docker/filebeat.docker.yml)
   or with curl
```shell
curl -L -O https://raw.githubusercontent.com/elastic/beats/7.17/deploy/docker/filebeat.docker.yml
```
It is already available in /src to get started immediately.
2. See which modules of filebeat are already enabled.
3. Add the module elasticsearch or system. (already enabled in Docker container)
4. Test if the module is enabled for Ubuntu full image.
5. Map a new Filebeat configuration to a custom image


```shell
FROM docker.elastic.co/beats/filebeat:7.17.0
COPY --chown=root:filebeat src/filebeat.yml /usr/share/filebeat/filebeat.yml
```
```shell
docker compose -f docker-compose.filebeat.yml up -d
```
```shell
docker compose -f docker-compose.es-kibana.yml -f docker-compose.logstash.yml -f docker-compose.filebeat.yml up -d
```
--remove-orphans??? reduce count of containers? volumes?
Open Commandline
1. Stop filebeat
2. See which modules of filebeat are already enabled.
3. Add the module elasticsearch or system. (already enabled in Docker container)
4. Test if the module is enabled.
5. Start filebeat
6. Setup pipeline for module ElasticSearch
7. Setup Output for Kibana.
8. Start filebeat
9. Go to Kibana: Burger-Menu -> Discover -> search for entries in log.file.path with “elasticsearch” or “syslog”, “auth.log”.
10. In the Commandline:
11. Have a look at the configuration files in `/etc/filebeat/modules.d`
12. List the one for the filebeat elasticsearch module
13. List all modules of filebeat, that are installed.
14. Which format does filebeat use to store configuration of modules?
15. How does filebeat handle enable and disable?
16. Where are logfiles for ElasticSearch stored?

### Step 4 for additional points

Call Elastic/Kibana-Dashboard in Browser :
```shell
localhost:5601
```
Burger Menu -> Manage Stack -> Data -> Rollup Jobs or -> Transforms
Create a Rollup in Kibana using the ingested data
Create a Transform in Kibana using the ingested data
Write a documentation, how you did that.

