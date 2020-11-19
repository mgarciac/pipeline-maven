#!/bin/bash

echo '***************************************'
echo '*********** Building JAR **************'
echo '***************************************'

WORKSPACE=/var/jenkins_home/workspace/pipeline-docker-maven
echo $WORKSPACE
echo $@

# docker run --rm -v /Users/mgarcia/Documents/Jenkins/jenkins-data/pipeline/jenkins/maven/.m2/:/root/.m2/ -v /Users/mgarcia/Documents/Jenkins/jenkins-data/pipeline/java-app/:/app -w /app maven:3-alpine "$@"
docker run --rm -v $WORKSPACE/jenkins/maven/.m2/:/root/.m2/ -v $WORKSPACE/java-app/:/app -w /app maven:3-alpine "$@"

# docker run --rm -v $WORKSPACE/java-app:/app -v /root/.m2/:/root/.m2/ -w /app maven:3-alpine "$@"