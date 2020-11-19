#!/bin/bash

echo '***************************************'
echo '*********** Building JAR **************'
echo '***************************************'

WORKSPACE=/var/jenkins_home/workspace/pipeline-docker-maven

echo 'Directory: $WORKSPACE/jenkins/maven/.m2/'
ls -l $WORKSPACE/jenkins/maven/.m2/

echo ' '

echo 'Directory: $WORKSPACE/java-app'
ls -l $WORKSPACE/java-app

docker run --rm -v $WORKSPACE/jenkins/maven/.m2/:/root/.m2/ -v $WORKSPACE/java-app/:/app -w /app maven:3-alpine mvn -B -DskipTests clean package "$@"

# TESTS =================================================================
# OK-Local: docker run --rm -v /Users/mgarcia/Documents/Jenkins/jenkins-data/pipeline/jenkins/maven/.m2/:/root/.m2/ -v /Users/mgarcia/Documents/Jenkins/jenkins-data/pipeline/java-app/:/app -w /app maven:3-alpine mvn -B -DskipTests clean package
# docker run --rm -v $WORKSPACE/jenkins/maven/.m2/:/root/.m2/ -v $WORKSPACE/java-app/:/app -w /app maven:3-alpine mvn -B -DskipTests clean package