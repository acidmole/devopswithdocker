#!/bin/sh

repository_url="$1"
$repository_url
git clone git@github.com:"$repository_url"
cd "$(basename "$repository_url")"
docker_image_name="$2"
docker login -u ${DOCKER_USER} -p ${DOCKER_PWD}
docker build -t "$docker_image_name" .
docker push "$docker_image_name"
