#!/bin/bash

echo '***************************************'
echo '******** Testing the code  ************'
echo '***************************************'

WORKSPACE=/var/jenkins_home/workspace/pipeline-docker-maven

# docker run --rm -v /Users/mgarcia/Documents/Jenkins/jenkins-data/pipeline/jenkins/maven/.m2/:/root/.m2/ -v /Users/mgarcia/Documents/Jenkins/jenkins-data/pipeline/java-app/:/app -w /app maven:3-alpine "$@"
docker run --rm -v $WORKSPACE/jenkins/maven/.m2/:/root/.m2/ -v $WORKSPACE/java-app/:/app -w /app maven:3-alpine "$@"