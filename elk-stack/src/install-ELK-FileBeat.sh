#!/bin/bash
# echo "####################################"
# echo "## Installing ElasticSearch 7.7.0 ##"
# echo "####################################"
# done according to https://www.elastic.co/guide/en/elasticsearch/reference/current/deb.html#deb-repo

wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add -
echo "deb https://artifacts.elastic.co/packages/8.x/apt stable main" | tee /etc/apt/sources.list.d/elastic-8.x.list
apt-get update
apt-get install elasticsearch logstash kibana filebeat libpostgresql-jdbc-java

# configuring elasticsearch for localhost only.
# https://www.elastic.co/guide/en/elasticsearch/reference/current/important-settings.html
# https://www.elastic.co/guide/en/elasticsearch/reference/7.7/breaking-changes-7.7.html#breaking_77_discovery_changes
# if your hardware does support more cpus, cores and memory you might want to upgrade from default virtual machine settings.
# 2 or more cores,  4 to 8GB memory
# sudo vi /etc/elasticsearch/elasticsearch.yml
# network.host: localhost
# cluster.name: myShopCluster1
# node.name: "myShopNode1"

echo ## cloning and installing german dictionary ##
mkdir /usr/share/elasticsearch/analysis
git clone https://github.com/uschindler/german-decompounder.git /usr/share/elasticsearch/analysis
chown -R elasticsearch:root /usr/share/elasticsearch/analysis
# curl -X GET http://localhost:9200

mkdir /usr/share/logstash/config
mkdir /usr/share/logstash/config/pipeline

echo '## Default Logstash configuration from Logstash base image.
## https://github.com/elastic/logstash/blob/master/docker/data/logstash/config/logstash-full.yml
#
http.host: "0.0.0.0"
xpack.monitoring.elasticsearch.hosts: [ "http://elasticsearch:9200" ]

## X-Pack security credentials
#
xpack.monitoring.enabled: true
xpack.monitoring.elasticsearch.username: elastic
xpack.monitoring.elasticsearch.password: changeme' > /usr/share/logstash/config/logstash.yml

echo '# This file is where you define your pipelines. You can define multiple.
# For more information on multiple pipelines, see the documentation:
#   https://www.elastic.co/guide/en/logstash/current/multiple-pipelines.html

- pipeline.id: main
  path.config: "/usr/share/logstash/pipeline"'  > /usr/share/logstash/config/pipelines.yml

echo 'input {
  beats {
    port => 5044
  }
}' > /usr/share/logstash/config/pipeline/02-beats-input.conf

echo 'output {
  if [@metadata][pipeline] {
    elasticsearch {
    hosts => [\"localhost:9200\"]
    manage_template => false
    index => \"%{[@metadata][beat]}-%{[@metadata][version]}-%{+YYYY.MM.dd}\"
    pipeline => \"%{[@metadata][pipeline]}\"
    }
  } else {
    elasticsearch {
    hosts => [\"localhost:9200\"]
    manage_template => false
    index => \"%{[@metadata][beat]}-%{[@metadata][version]}-%{+YYYY.MM.dd}\"
    }
  }
}' > /usr/share/logstash/config/pipeline/30-elasticsearch-output.conf
# /usr/share/logstash/bin/logstash --path.settings /etc/logstash -t
# Should display
# Config Validation Result: OK. Exiting Logstash
# workarounds due to bugs
# installing jdbc postgres driver for logstash
cp /usr/share/java/postgresql.jar /usr/share/logstash/logstash-core/lib/jars

