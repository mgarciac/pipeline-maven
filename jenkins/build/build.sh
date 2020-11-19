#!/bin/bash

# Copy the new JAR to the build location
echo "*******************************************"
echo "** Copying the new JAR to build location **"
echo "*******************************************"
cp ../../java-app/target/*.jar .

# Building the docker image
echo "*******************************************"
echo "********** Building Docker Image **********"
echo "*******************************************"
cd ../../jenkins/build && docker-compose -f docker-compose-build.yml build --no-cache
