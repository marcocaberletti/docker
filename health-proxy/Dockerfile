FROM nginx:1.17.5

LABEL maintainer "Bot Platform Eng. <bot-platform@conversocial.com>"

ENV PORT "80"
ENV BACKEND "127.0.0.1:8080"
ENV HEALTH_PATH "/health"
ENV HEALTH_TARGET "/actuator/health"

COPY files/run.sh /run.sh
RUN chmod +x /run.sh
CMD /run.sh
