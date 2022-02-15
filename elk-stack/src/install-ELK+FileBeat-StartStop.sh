

bash -c "echo 'su - elasticsearch -c \"/usr/share/elasticsearch/bin/elasticsearch -Expack.security.enabled=false -Ediscovery.type=single-node\"' >> /usr/local/bin/StartElasticSearch.sh"
bash -c "echo 'sudo systemctl stop elasticsearch' >> /usr/local/bin/StopElasticSearch.sh"
bash -c "echo 'sudo systemctl start kibana' >> /usr/local/bin/StartKibana.sh"
bash -c "echo 'sudo systemctl stop kibana' >> /usr/local/bin/StopKibana.sh"
bash -c "echo 'sudo systemctl start filebeat' >> /usr/local/bin/StartFilebeat.sh"
bash -c "echo 'sudo systemctl stop filebeat' >> /usr/local/bin/StopFilebeat.sh"
bash -c "echo 'sudo systemctl start logstash' >> /usr/local/bin/StartLogstash.sh"
bash -c "echo 'sudo systemctl stop logstash' >> /usr/local/bin/StopLogstash.sh"
bash -c "echo 'StartElasticSearch.sh' > /usr/local/bin/StartELK.sh"
bash -c "echo 'StartLogstash.sh' >> /usr/local/bin/StartELK.sh"
bash -c "echo 'StartKibana.sh' >> /usr/local/bin/StartELK.sh"
bash -c "echo 'StopKibana.sh' >> /usr/local/bin/StopELK.sh"
bash -c "echo 'StopLogstash.sh' >> /usr/local/bin/StopELK.sh"
bash -c "echo 'StopElasticSearch.sh' > /usr/local/bin/StopELK.sh"
chmod a+x /usr/local/bin/*ElasticSearch.sh
chmod a+x /usr/local/bin/*Kibana.sh
chmod a+x /usr/local/bin/*Logstash.sh
chmod a+x /usr/local/bin/*Filebeat.sh
chmod a+x /usr/local/bin/*ELK.sh
usermod -d /usr/share/elasticsearch -s /bin/bash elasticsearch
usermod -d /usr/share/kibana -s /bin/bash kibana
usermod -d /usr/share/logstash -s /bin/bash logstash

