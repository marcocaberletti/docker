FROM centos:7

ARG ES_VERSION=5.1.1-1

ENV CLUSTER_NAME=elasticsearch
ENV NODE_MASTER=true
ENV NODE_DATA=false
ENV NODE_INGEST=true
ENV HTTP_ENABLE=true
ENV MASTER_HOST=es-master
ENV NUMBER_OF_MASTERS=1
ENV MAX_STORAGE_NODES=10

COPY files/elastic.repo /etc/yum.repos.d/

RUN yum install -y java-1.8.0-openjdk java-1.8.0-openjdk-devel elasticsearch-${ES_VERSION} && \
    yum clean all
    
RUN /usr/share/elasticsearch/bin/elasticsearch-plugin install -b ingest-geoip

COPY files/elasticsearch.yml /etc/elasticsearch/

USER elasticsearch

CMD /usr/share/elasticsearch/bin/elasticsearch -Epath.conf=/etc/elasticsearch/