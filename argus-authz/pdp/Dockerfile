FROM centos:7

ARG PDP_VERSION="1.7.0-1"

ENV JAVA_OPTS="-Xmx256M"
ENV PAP_URLS=""
ENV ENABLE_SSL=true
ENV RETENTION_INTERVAL=240

RUN	yum install -y http://linuxsoft.cern.ch/wlcg/centos7/x86_64/wlcg-repo-1.0.0-1.el7.noarch.rpm && \
	yum install -y http://repository.egi.eu/sw/production/umd/4/centos7/x86_64/base/umd-release-4.0.0-1.el7.noarch.rpm && \
	yum update -y && \
    yum install -y openssl gettext iproute argus-pdp-${PDP_VERSION}.el7.centos && \
    yum clean all

COPY files/argus-pdp.tmpl /tmp
COPY files/pdp.ini.tmpl /tmp
COPY files/run.sh /run.sh

EXPOSE 8152
EXPOSE 8153

CMD /run.sh
