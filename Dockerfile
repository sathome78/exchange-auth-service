

FROM java:8
VOLUME /tmp
ARG APP_PATH=/exrates-auth-service
ARG ENVIRONMENT

RUN mkdir -p exrates-auth-service
COPY ./target/authorization-service.jar ${APP_PATH}/authorization-service.jar
COPY ./target/config/dev/application.yml ${APP_PATH}/application.yml
ARG CONFIG_FILE_PATh="-Dspring.config.location="${ENVIRONMENT}"/application.yml"
RUN echo ${CONFIG_FILE_PATh}

WORKDIR ${APP_PATH}

EXPOSE 8080

#CMD ["java","-Dspring.config.location=", '$CONFIG_FILE_PATH', "-jar", "authorization-service.jar"]
CMD java $CONFIG_FILE_PATh -jar authorization-service.jar


