FROM centos:7

RUN yum install -y http://repo.zabbix.com/zabbix/3.0/rhel/7/x86_64/zabbix-release-3.0-1.el7.noarch.rpm
RUN yum clean all && \
    yum update -y && \
    yum install -y zabbix-java-gateway

EXPOSE 10052

CMD /usr/sbin/zabbix_java_gateway && \
    /usr/bin/tail -f /var/log/zabbix/zabbix_java_gateway.log
