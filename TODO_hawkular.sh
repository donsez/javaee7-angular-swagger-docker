#!/bin/sh

# Author: Didier DONSEZ
# License ASL 2.0

# The script runs hawkular-apm-server

INSTANCE_ID=1
WEB_PORT=8088
# docker run --name hawkular-aio-${INSTANCE_ID} -p 8088:8080 jboss/hawkular-aio
docker run --name hawkular-apm-server-${INSTANCE_ID} -p $WEB_PORT:8080 -d jboss/hawkular-apm-server

echo hawkular-apm-server-${INSTANCE_ID} credential are:
docker logs hawkular-apm-server-${INSTANCE_ID} | grep -E "Username|Password"

open http://localhost:$WEB_PORT
