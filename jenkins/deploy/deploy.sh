#!/bin/bash

echo maven-project > /tmp/.auth
echo $BUILD_TAG >> /tmp/.auth
echo $PASS >> /tmp/.auth

scp -i /Users/mgarcia/Documents/Jenkins/jenkins-data/centos8-azure/prod-user /tmp/.auth prod-user@52.167.225.54:/tmp/.auth

# scp -i /Users/mgarcia/Documents/Jenkins/jenkins-data/centos8-azure/prod-user ./deploy/publish.sh prod-user@52.167.225.54:/tmp/publish
scp -i /Users/mgarcia/Documents/Jenkins/jenkins-data/centos8-azure/prod-user ./jenkins/deploy/publish.sh prod-user@52.167.225.54:/home/prod-user/publish

# ssh -i /Users/mgarcia/Documents/Jenkins/jenkins-data/centos8-azure/prod-user prod-user@52.167.225.54 "/tmp/publish/publish.sh"
ssh -i /Users/mgarcia/Documents/Jenkins/jenkins-data/centos8-azure/prod-user prod-user@52.167.225.54 "/home/prod-user/publish/publish.sh"