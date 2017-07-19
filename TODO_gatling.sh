#!/bin/sh

# Author: Didier DONSEZ
# License ASL 2.0

# The script runs gatling for benchmarking the JavaEE angular RESTFul backend

open http://gatling.io/docs/current/general/simulation_setup/


# wget https://repo1.maven.org/maven2/io/gatling/highcharts/gatling-charts-highcharts-bundle/2.2.5/gatling-charts-highcharts-bundle-2.2.5-bundle.zip
# unzip gatling-charts-highcharts-bundle-2.2.5-bundle.zip
# cd gatling-charts-highcharts-bundle-2.2.5-bundle
# cd bin
# ./gatling.sh

# docker run --rm gatling:2.2.5 -s computerdatabase.BasicSimulation

mkdir gatlings
cd gatlings

INSTANCE_ID=1

WORKDIR=$(pwd)
#docker run -it --rm -v $WORKDIR/conf:/opt/gatling/conf \
#-v $WORKDIR/user-files:/opt/gatling/user-files \
#-v $WORKDIR/results:/opt/gatling/results \
#denvazh/gatling


mkdir results

docker run --name gatling-${INSTANCE_ID} -it --rm \
  -v $WORKDIR/results:/opt/gatling/results \
  denvazh/gatling

open results/AZERT-*/index.html
