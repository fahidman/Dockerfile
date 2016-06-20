


# Configure elasticsearch
1) sudo vim /etc/elasticsearch/elasticsearch.yml
change_the_cluster_name= graylog

2) restart elasticsearch : 

sudo /etc/init.d/elasticsearch restart
# Configure the graylog-server
3) sudo vim /etc/graylog/server/server.conf

configure the graylog-server
Follow the instructions in your "/etc/graylog/server/server.conf" and add "password_secret" and "root_password_sha2". These settings are mandatory and without them, Graylog will not start!

then run sudo start graylog-server
