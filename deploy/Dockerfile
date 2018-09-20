FROM openjdk:8-jdk-alpine
VOLUME /tmp
ARG path_to_artifact
RUN echo $path_to_artifact
RUN echo $PWD
#RUN if [ ! -f $path_to_artifact ]; then
#       echo "File not found!"
#fi

RUN if [ ! -f $path_to_artifact ]; then echo Argument not provided ; else echo Argument is $arg ; fi
#COPY ${JAR_FILE} app.jar
#ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]