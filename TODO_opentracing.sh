#!/bin/sh

# Author: Didier DONSEZ
# License ASL 2.0

# The script runs opentracing

open http://opentracing.io/documentation/

docker run -d -p 5775:5775/udp -p 16686:16686 jaegertracing/all-in-one:latest
