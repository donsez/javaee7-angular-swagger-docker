#!/bin/bash

# Author: Didier DONSEZ
# License ASL 2.0

# Build script for the Wildfly container containing javaee7-angular simple web app and swagger UI

COMPONENT_VERSION="1.0"
COMPONENT_NAME="wildfly-app"
COMPONENT_INSTANCE=1
# DOCKERFILE=${COMPONENT_NAME}.df
DOCKERFILE=Dockerfile

WORKDIR=$(pwd)

wait_for_host_port(){
	echo "Wait for $1:$2 ..."
	until nc -vzw 2 $1 $2 &>/dev/null;
	do
	   echo "Wait for $1:$2"
	   sleep 1
	done
	echo "$1:$2 ready"
}

# Install Docker
# TODO

# Install Java and Maven
# TODO

# Get javaee7-angular
mkdir tmp1
cd tmp1
git clone https://github.com/radcortez/javaee7-angular.git
cd javaee7-angular
mvn clean install
cd ../..

# Get swagger-ui
mkdir tmp2
cd tmp2
git clone https://github.com/swagger-api/swagger-ui.git
cd swagger-ui

cd $WORKDIR

cp tmp1/javaee7-angular/target/javaee7-angular.war .
mkdir swagger-ui
cp -r tmp2/swagger-ui/dist/* swagger-ui/

docker pull jboss/wildfly
docker build -t ${COMPONENT_NAME}-${COMPONENT_INSTANCE}:${COMPONENT_VERSION} -f $DOCKERFILE .

docker run  --hostname ${COMPONENT_NAME}-${COMPONENT_INSTANCE} --name ${COMPONENT_NAME}-${COMPONENT_INSTANCE} -p 8080:8080 -p 9990:9990 -d ${COMPONENT_NAME}-${COMPONENT_INSTANCE}:${COMPONENT_VERSION}


# Open URLs
wait_for_host_port localhost 8080
open http://localhost:8080/

open http://localhost:8080/javaee7-angular

# wait_for_host_port localhost 8443
open https://localhost:8443/javaee7-angular

# wait_for_host_port localhost 9990
open http://localhost:9990/management
