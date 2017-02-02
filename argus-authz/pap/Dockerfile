FROM centos:7

ARG PAP_VERSION="1.7.0-1"

ENV JAVA_OPTS=""

RUN	yum install -y http://linuxsoft.cern.ch/wlcg/centos7/x86_64/wlcg-repo-1.0.0-1.el7.noarch.rpm && \
	yum install -y http://repository.egi.eu/sw/production/umd/4/centos7/x86_64/base/umd-release-4.0.0-1.el7.noarch.rpm && \
	yum update -y && \
    yum install -y openssl gettext iproute argus-pap-${PAP_VERSION}.el7.centos && \
    yum clean all

COPY files/argus-pap.tmpl /tmp
COPY files/pap-admin.properties.tmpl /tmp
COPY files/pap_configuration.ini.tmpl /tmp
COPY files/run.sh /run.sh

EXPOSE 8150
EXPOSE 8151

CMD /run.sh
