FROM ubuntu:14.04

##install_mongodb

RUN sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
RUN echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list
RUN sudo apt-get update
RUN sudo apt-get install -y mongodb-org


##install_java_8

RUN apt-get install -y software-properties-common
RUN sudo add-apt-repository ppa:webupd8team/java
RUN sudo apt-get update
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
RUN sudo apt-get install -y oracle-java8-installer

##install_elasticsearch

RUN apt-get install -y apt-transport-https 
RUN apt-get install -y vim
RUN wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
RUN echo "deb https://packages.elastic.co/elasticsearch/2.x/debian stable main" | sudo tee -a /etc/apt/sources.list.d/elasticsearch-2.x.list
RUN sudo apt-get update && sudo apt-get install -y elasticsearch
#####RUN sudo vim /etc/elasticsearch/elasticsearch.yml

##change_the_cluster_name= graylog

RUN sudo update-rc.d elasticsearch defaults 95 10
##RUN sudo /etc/init.d/elasticsearch restart
RUN apt-get install -y curl



##graylog

RUN sudo apt-get install -y apt-transport-https uuid-runtime pwgen
RUN wget https://packages.graylog2.org/repo/packages/graylog-2.0-repository_latest.deb
RUN sudo dpkg -i graylog-2.0-repository_latest.deb
RUN sudo apt-get update
RUN sudo apt-get install -y graylog-server

##config_graylog-server_config

###RUN sudo vim /etc/graylog/server/server.conf

##Follow the instructions in your /etc/graylog/server/server.conf and ##add password_secret and root_password_sha2. These settings are ##mandatory and without them, Graylog will not start!


###RUN sudo start graylog-server

