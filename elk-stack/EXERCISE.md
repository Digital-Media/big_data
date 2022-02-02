# Exercises with a search engine

We use ElasticSearch to write Search queries and PostgreSQL to to copy data with logstash.
Filebeat is used for demonstrating how log entries can be ingested into ElasticSearch in a simpler way than with logstash.
We use Kibana as a Browser Frontend to visualize data and get easier access to ElasticSearch.

ElasticSearch is also used to show a typical BIG DATA pipeline.

## Get an ELK installation

See [INSTALL.md](https://github.com/Digital-Media/big_data/blob/main/elk-stack/INSTALL.md) for Details and Troubleshooting

## Exercise for ELK Stack

Open a terminal in the Big Data Image. Have a look at a [Guideline provided by DigitalOcean](https://www.digitalocean.com/community/tutorials/how-to-install-elasticsearch-logstash-and-kibana-elastic-stack-on-ubuntu-20-04-de) to see installation steps for Ubuntu 20.04.
Store commands of each step in a *.txt file.

### Step 1: Adding a new module to filebeat and test it in Kibana

Open Commandline
1. Stop filebeat
2. See which modules of filebeat are already enabled.
3. Add the module elasticsearch or system
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

### Step 2: See a simple LogStash-Pipeline in Action
       
Open Commandline
See [Elastic Guide](https://www.elastic.co/guide/en/logstash/current/first-event.html)
1. Go to Installation-Directory of logstash
2. enter bin directory
3. become root to get write-access to data-dirctory
4. start logstash with input from commandline and output to commandline
5. enter some text
6. end logstash commandline
7. list logstash plugins with its version
8. see if jdbc-integration-plugin is installed

      This is useful for testing a jdbc-connection to a database
```json
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
### Step 2: Working with LogStach jdbc and PostgreSQL

Open Commandline
See this [medium blog](https://medium.com/@emreceylan/how-to-sync-postgresql-data-to-elasticsearch-572af15845ad)
1.	Create a table in postgres. For Example: orders, visits, order_items
2.	See for [Examples](https://github.com/Digital-Media/big_data/blob/main/elk-stack/examples.sql).
3.	create a configuration file to get data from postgres public.orders in /etc/logstash/conf.d
4.	optional: configure a pipeline in `/etc/logstash/pipelines.yml` (a default is there)
      Step 3 for additional 8 points

Call Elastic/Kibana-Dashboard in Browser : 
```shell
localhost:5601
```
Burger Menu -> Manage Stack -> Data -> Rollup Jobs or -> Transforms
Create a Rollup in Kibana using the ingested data
Create a Transform in Kibana using the ingested data
Write a documentation, how you did that.

