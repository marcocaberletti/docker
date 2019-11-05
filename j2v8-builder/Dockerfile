FROM python:2.7

ENV WORKDIR /root/workdir

RUN curl -L -C - -b "oraclelicense=accept-securebackup-cookie" -O http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.tar.gz && \
    mkdir -p /opt/jdk && \
    tar x -C /opt/jdk -f jdk-8u131-linux-x64.tar.gz && \
    rm -rf jdk-8u131-linux-x64.tar.gz && \
    update-alternatives --install /usr/bin/java java /opt/jdk/jdk1.8.0_131/bin/java 100 && \
    update-alternatives --install /usr/bin/javac javac /opt/jdk/jdk1.8.0_131/bin/javac 100 && \
    update-alternatives --install /usr/bin/javah javah /opt/jdk/jdk1.8.0_131/bin/javah 100

RUN curl http://archive.apache.org/dist/maven/maven-3/3.5.0/binaries/apache-maven-3.5.0-bin.tar.gz -O && \
    mkdir -p /opt && \
    tar xzvf apache-maven-3.5.0-bin.tar.gz -C /opt/ && \
    chmod -R 777 /opt/apache-maven-3.5.0 && \
    rm -rf apache-maven-3.5.0-bin.tar.gz

RUN apt-get update && \
    apt-get install -y cmake execstack vim && \
    apt-get clean all

RUN cd /opt && \
    git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git

COPY files/run.sh /root/run.sh
RUN chmod +x /root/run.sh && \
    mkdir -p ${WORKDIR}

CMD /root/run.sh
