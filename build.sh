#!/usr/bin/env bash

DOCKER_DEPLOY_DIRECTORY=${PWD}

echo $DOCKER_DEPLOY_DIRECTORY

cd ..
cd target

TARGET_DIRECTORY=${PWD}

ARTIFACT_PATH=$TARGET_DIRECTORY"/authorization-service.jar"

echo $ARTIFACT_PATH

cd $DOCKER_DEPLOY_DIRECTORY

docker build -t authorization_service --build-arg JAR_FILE=$ARTIFACT_PATH --network=host .