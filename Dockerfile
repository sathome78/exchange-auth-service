

FROM java:8
RUN apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    net-tools \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
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
#CMD java $CONFIG_FILE_PATh -jar authorization-service.jar --spring.profiles.active=${ENVIRONMENT}

CMD java  -jar authorization-service.jar


