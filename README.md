


# Configure elasticsearch
1) sudo vim /etc/elasticsearch/elasticsearch.yml
change_the_cluster_name= graylog

2) restart elasticsearch
sudo /etc/init.d/elasticsearch restart
# Configure the graylog-server
3) sudo vim /etc/graylog/server/server.conf
configure the graylog-server
then run sudo start graylog-server
