FROM centos:7

ARG PEP_VERSION="1.7.2-1"

ENV JAVA_OPTS="-Xmx256M"
ENV PDP_URLS=""
ENV ENABLE_SSL=true

RUN	yum install -y http://linuxsoft.cern.ch/wlcg/centos7/x86_64/wlcg-repo-1.0.0-1.el7.noarch.rpm && \
	yum install -y http://repository.egi.eu/sw/production/umd/4/centos7/x86_64/base/umd-release-4.0.0-1.el7.noarch.rpm && \
	yum update -y && \
    yum install -y openssl gettext iproute argus-pep-server-${PEP_VERSION}.el7.centos && \
    yum clean all

COPY files/argus-pepd.tmpl /tmp
COPY files/pepd.ini.tmpl /tmp
COPY files/run.sh /run.sh

EXPOSE 8154
EXPOSE 8155

CMD /run.sh
