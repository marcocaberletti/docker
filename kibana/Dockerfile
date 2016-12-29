FROM centos:7

ENV KIBANA_VERSION=5.1.1-1
ENV KIBANA_BASEPATH=/
ENV ELASTICSEARCH_URL=http://localhost:9200

COPY files/elastic.repo /etc/yum.repos.d/

RUN yum install -y gettext kibana-${KIBANA_VERSION} && \
    yum clean all

COPY files/kibana.tmpl /etc/kibana/

RUN envsubst < /etc/kibana/kibana.tmpl > /etc/kibana/kibana.yml

USER kibana

CMD /usr/share/kibana/bin/kibana -c /etc/kibana/kibana.yml
