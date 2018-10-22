FROM java:8
VOLUME /tmp
ARG APP_PATH=/exrates-auth-service
ARG ENVIRONMENT

RUN mkdir -p exrates-auth-service
COPY ./target/authorization-service.jar ${APP_PATH}/authorization-service.jar
COPY ./target/config/${ENVIRONMENT}/application.yml ${APP_PATH}/application.yml
WORKDIR ${APP_PATH}
RUN readlink -f application.yml
EXPOSE 8080
#CMD java -jar authorization-service.jar --spring.config.location=/exrates-auth-service/application.yml
#
CMD java -jar authorization-service.jar