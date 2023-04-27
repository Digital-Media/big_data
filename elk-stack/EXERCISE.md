# Exercises with a search engine

We use ElasticSearch to write Search queries and PostgreSQL to to copy data with logstash.
Metricbeat is used for demonstrating how KPI data of Docker containers can be ingested into ElasticSearch in a simpler way than with logstash.
We use Kibana as a Browser Frontend to visualize data and get easier access to ElasticSearch.

ElasticSearch is also used to show a typical BIG DATA pipeline.

## Get an ELK installation

See [INSTALL.md](https://github.com/Digital-Media/big_data/blob/main/elk-stack/INSTALL.md) for Details and Troubleshooting

## Exercises for ELK Stack

Store commands of each step with additional description - if necessary to follow your steps - in a *.pdf.

### Step 1: See a simple LogStash-Pipeline in Action

- Open Powershell or other terminal.
- Go to your Docker installation `cd `
- See [Elastic Guide](https://www.elastic.co/guide/en/logstash/current/first-event.html) for first steps with logstash
1. ```shell
   docker compose -f docker-compose.yml up -d
   ```
2. ```shell
   docker exec -it elk-stack-dock-logstash-1 /bin/bash
   ```
3. If you start a shell with Docker Desktop enter `bash` to use a more comfortable shell.
4. Find out where logstash is installed
5. `cd` to bin directory of logstash
6. Test a simple pipeline with input from and output to commandline. 
7. When using a docker container with an running Instance of logstash you have to use another `data` directory.
8. You have to start the second logstash process with the flag `--path.data data2`
9. Wait until pipeline is running
   
   `[INFO ] 2022-02-14 07:56:05.167 [Agent thread] agent - Pipelines running {:count=>1, :running_pipelines=>[:main], :non_running_pipelines=>[]}`
   Then type `hello world`
10. Stop the pipeline with `STRG-D`
11. List logstash plugins with its version
12. See if jdbc-integration-plugin is installed 
13. Test the logstash configuration with
    ```shell
    /usr/share/logstash/bin/logstash --path.settings /usr/share/logstash/config -t
    ```

### Step 2: Working with LogStash jdbc and PostgreSQL

Work with logstash as shown in [Step 1](https://github.com/Digital-Media/big_data/blob/main/elk-stack/EXERCISE.md#step-1-see-a-simple-logstash-pipeline-in-action)


The next steps are useful for testing a jdbc-connection to a Postgres container
- rework the following example to use postgres connector instead of mariadb and add additional parameters to send data
```shell
/usr/share/logstash/bin/logstash --path.data data2 -e 'input {
      jdbc {
      jdbc_connection_string =>     "jdbc:mariadb://mariadb=192.168.0.41:6633/onlineshop"
      jdbc_user => "onlineshop"
      jdbc_password => "geheim"
      jdbc_driver_class => "Java::org.mariadb.jdbc.Driver"
      statement => "SELECT * FROM onlineshop.user"
      }
      } output { stdout {} }'
```
1. Create a table in postgres. For Example: orders, visits, order_items. 
- See [Examples](https://github.com/Digital-Media/big_data/blob/main/elk-stack/examples.sql).
- Rework the configuration file /usr/share/logstash/pipeline/logstash.conf to get data from postgres public.orders|visits|order_itmes 
- The file to work with is mapped to `<path-to-your-docker>/elk-stack-dock/logstash/pipeline/logstash.conf`
2. replace ip with name of your host or use host.docker.internal:postgresport if you use a docker container with a separate network  or connect postgres Container to ELK-Stack with: `docker network connect elk-stack-dock_elk postgres` to use `jdbc:postgresql://postgres:5432/onlineshop`
- Open a commandline
- See this [medium blog](https://medium.com/@emreceylan/how-to-sync-postgresql-data-to-elasticsearch-572af15845ad) for how to setup a pipeline with jdbc.
3. Install postgres-driver. See [jdbc-input Doku](https://www.elastic.co/guide/en/logstash/current/plugins-inputs-jdbc.html)
4. Add tracking for PK column with :sql_last_value
5. You have to add a line for scheduling to make logstasth run without interruption: `schedule => "*/5 * * * *"`
   - optional: configure a pipeline in `/usr/share/logstash/config/pipelines.yml` (a default is there). This file is not mapped.
6. Go to Kibana -> Management -> Dev Tools and query logstash index, to see the data rows stored in ES by the pipeline built.

- Compare with MongoDB Pipeline 
- See https://www.mongodb.com/developer/products/mongodb/mongoimport-guide/ to get a glue how MongoDB supports you in this case.
- See for a video-description: https://www.mongodb.com/developer/videos/import-data-into-mongodb-3-ways---bonus--export-data-from-postgres/
- MongoDB Compass can be installed locally, but Docker project was last updated in 2021.
7. Write a short summary, what is different to ELK and give a statement, what you think is easier to automate.

### Step 3: Adding a Metricbeat pipeline and build dashboards in Kibana

- See [Metricbeat README](https://github.com/Digital-Media/elk-stack-dock/tree/main/extensions/metricbeat#readme) for this.
- First only start the ELK-Stack. See logs of Kibana, to see if all services are already running.
- In a browser connect to `http://localhost:5601`. username/pwd: elastic/changeme
- Then use the command to start metricbeat container
1. activate requested passwords for metricbeat in `<path-to-your-docker>/elk-stack-dock/.env`.
2. rerun setup container
3. restart metricbeat
4. Test, if data are retrieved by elasticsearch with curl or step over to 8. Dev Tools for that.
   - `curl -u elastic:changeme http://localhost:9200/_search`
   - `curl -u elastic:changeme http://localhost:9200/logstash/_search`
   - `curl -u elastic:changeme http://localhost:9200/logstash/_search?pretty=true`
- See [Query DSL Doku](https://www.elastic.co/guide/en/elasticsearch/reference/8.6/query-dsl.html) for the next steps.
5. either find the curl command to query for a specific entry in a table with a match
6. and one, that doesn't match any database entry
7. or Connect to Kibana in Browser
8. Goto Burger Menu -> Management -> Dev Tools
10. Query for all entries in logstash index.
11. Query for a specific entry, like you did with curl
12. Sort the entries in asc and desc order
