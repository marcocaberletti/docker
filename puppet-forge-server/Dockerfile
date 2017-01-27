FROM centos:7

RUN yum update -y && \
    yum install -y gem ruby-devel gcc make && \
    yum clean all

RUN gem install puppet-forge-server

RUN adduser forge -d /var/lib/forge -s /bin/false

ADD files/run.sh /
RUN chmod +x /run.sh

USER forge
WORKDIR /var/lib/forge

EXPOSE 8080

CMD /run.sh
