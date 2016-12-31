FROM centos:7

ENV KIBANA_VERSION=5.1.1-1
ENV KIBANA_BASEPATH=''
ENV ELASTICSEARCH_URL=http://localhost:9200

COPY files/elastic.repo /etc/yum.repos.d/

RUN yum install -y gettext kibana-${KIBANA_VERSION} && \
    yum clean all

COPY files/kibana.tmpl /etc/kibana/
COPY files/run.sh /

RUN chown -R kibana:kibana /etc/kibana && \
    chmod +x /run.sh

USER kibana

CMD /run.sh
