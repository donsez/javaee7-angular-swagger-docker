#!/bin/sh

# Author: Didier DONSEZ
# License ASL 2.0

# The script runs opentracing

open http://opentracing.io/documentation/

INSTANCE_ID=1

docker run --name opentracing-${INSTANCE_ID} -d -p 5775:5775/udp -p 16686:16686 jaegertracing/all-in-one:latest
