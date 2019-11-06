FROM maven:3-jdk-8

LABEL maintainer "Bot Platform Eng. <bot-platform@conversocial.com>"

ENV MAVEN_UID="1000"
ENV MAVEN_CONFIG='/home/maven/.m2'

ENV UID=""
ENV GID=""

RUN apt-get update && \
    apt-get install -y sudo && \
    apt-get clean && \
    useradd --user-group --uid ${MAVEN_UID} --home /home/maven --create-home --shell /bin/bash maven

COPY files/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]

CMD mvn --version
