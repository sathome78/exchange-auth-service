FROM java:8
VOLUME /tmp
ARG APP_PATH=/exrates-auth-service
ARG ENVIRONMENT

RUN curl -L -O http://172.50.50.9:8081/artifactory/elk-libs/filebeat-6.5.3-amd64.deb
RUN dpkg -i filebeat-6.5.3-amd64.deb
RUN rm -f filebeat-6.5.3-amd64.deb
RUN curl -L -O http://172.50.50.9:8081/artifactory/elk-libs/filebeat.yml
RUN mv filebeat.yml /etc/filebeat/
RUN systemctl enable filebeat

RUN mkdir -p exrates-auth-service
COPY ./target/authorization-service.jar ${APP_PATH}/authorization-service.jar
COPY ./target/config/${ENVIRONMENT}/application.yml ${APP_PATH}/application.yml
WORKDIR ${APP_PATH}
RUN readlink -f application.yml
EXPOSE 8080
CMD ["/etc/init.d/filebeat", "start"]
CMD java -jar authorization-service.jar
