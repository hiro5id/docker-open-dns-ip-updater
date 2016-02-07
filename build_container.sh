#!/bin/bash
set -x
set -e

CURRENT_DIR=${PWD##*/}
#cd $(dirname ${BASH_SOURCE[0]})/container/
#rm -rf build/CodeContracts/
#rm -f build/*.pdb
#rm -f build/*.xml
#rm -f build/Wind.Boreas.WebApp.vshost*
#ls -l src/

#REGISTRY=pas-docker-registry.cognostm1.ibmcloud.com
IMAGE_NAME=sebestyen/${CURRENT_DIR}
#Look for supplied tag
TAG=$1
export TAG=${TAG:='latest'}
echo Using image name ${IMAGE_NAME}

# we --rm=true because we want to remove the intermediary build image
docker build -rm=true -t ${IMAGE_NAME}:${TAG} .
