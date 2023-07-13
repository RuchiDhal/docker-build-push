#!/bin/bash
docker build -t nginx:v1 .
#check if Environment variables are present or not
if [[ -z "${DOCKER_USERNAME}" ]]; then
  echo "ERROR - enviroment variable DOCKER_USERNAME not found"
  exit 1
else
   echo "enviromnet variable DOCKER_USERNAME found. Using this"
fi
if [[ -z "${DOCKER_PASSWORD}" ]]; then
  echo "enviroment variable DOCKER_PASSWORD not found"
  exit 1
else
   echo "enviromnet variable DOCKER_PASSWORD found. Using this"
fi
docker login -u "${DOCKER_USERNAME}" -p "${DOCKER_PASSWORD}"
#tagging the image
docker tag nginx:v1 ${DOCKER_USERNAME}/nginx:v1
#push the docker image to dockerhub
docker push ${DOCKER_USERNAME}/nginx:v1
if [ $(echo $?) == 0 ]; then
 echo "docker image pushed successfully"
else 
 echo "ERROR"
fi 