#!/bin/bash

echo '***************************************'
echo '********** Pushing image  *************'
echo '***************************************'

IMAGE="maven-project"

echo "*********** Login In ******************"
docker login -u mgarciac88 -p $PASS

echo "*********** Tagging Image *************"
echo $IMAGE:$BUILD_TAG
docker tag $IMAGE:$BUILD_TAG mgarciac88/$IMAGE:$BUILD_TAG

echo "*********** Pushing Image *************"
docker push mgarciac88/$IMAGE:$BUILD_TAG