#FROM openjdk:8-jdk-alpine
#MAINTAINER nikita.dmytrenko@upholding.biz
#RUN echo $PWD
#VOLUME /tmp
#ARG JAR_FILE
#RUN echo $JAR_FILE
#RUN ls -a
#RUN cd ..
#RUN ls -a
#ADD ${JAR_FILE} authorization-service.jar
#COPY ${JAR_FILE} app.jar
#RUN ls -a
#ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/authorization-service.jar"]
#EXPOSE 8888
#
#FROM java:8
#RUN cd ..
#RUN ls -a
##RUN cd target
#COPY pom.xml /opt/pom.xml
#COPY ../target/authorization-service.jar /usr/src/hola/
#WORKDIR /usr/src/hola
#EXPOSE 8080
#CMD ["java", "-jar", "authorization-service.jar"]

FROM java:8

ARG APP_PATH=/exrates-auth-service

RUN mkdir -p exrates-auth-service
#RUN iptables -t filter -A INPUT -p tcp -i docker0 --dport 3306 -j ACCEPT
RUN cd /var/lib/
RUN ls -l
COPY ./target/authorization-service.jar ${APP_PATH}/authorization-service.jar
COPY ./config/application.yml ${APP_PATH}/application.yml


WORKDIR ${APP_PATH}

EXPOSE 8080
EXPOSE 3306

CMD ["java","-Dspring.config.location=application.yml", "-jar", "authorization-service.jar"]

