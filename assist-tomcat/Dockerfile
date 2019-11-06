FROM centos:7

ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH
RUN mkdir -p "$CATALINA_HOME"
WORKDIR $CATALINA_HOME

RUN yum install -y curl wget tar && \
    yum install -y https://assist-devops-software.s3-us-west-2.amazonaws.com/oracle-jdk/jdk-8u202-linux-x64.rpm && \
    yum clean all

RUN wget --quiet -O /tmp/apache-tomcat-9.0.14.tar.gz https://assist-devops-software.s3-us-west-2.amazonaws.com/tomcat/apache-tomcat-9.0.14.tar.gz && \
    tar xzf /tmp/apache-tomcat-9.0.14.tar.gz --strip 1 -C /usr/local/tomcat && \
    rm -rf /tmp/apache-tomcat-9.0.14.tar.gz

EXPOSE 8080
CMD ["catalina.sh", "run"]