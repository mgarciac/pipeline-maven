#!/bin/bash

echo '***************************************'
echo '*********** Building JAR **************'
echo '***************************************'

WORKSPACE=/var/jenkins_home/workspace/pipeline-docker-maven
echo $WORKSPACE
echo $@

ls -a $WORKSPACE/jenkins/maven/.m2/
ls -a $WORKSPACE/java-app
docker run --rm -v $WORKSPACE/java-app:/app -v $WORKSPACE/jenkins/maven/.m2/:/root/.m2/ -w /app maven:3-alpine "$@"

# TESTS =================================================================
# OK-Local: docker run --rm -v /Users/mgarcia/Documents/Jenkins/jenkins-data/pipeline/jenkins/maven/.m2/:/root/.m2/ -v /Users/mgarcia/Documents/Jenkins/jenkins-data/pipeline/java-app/:/app -w /app maven:3-alpine mvn -B -DskipTests clean package
