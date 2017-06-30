#!/bin/bash

# Author: Didier DONSEZ
# License ASL 2.0

WEB_SERVER=http://127.0.0.1:8080

# Data Format
ACCEPT_JSON="Accept: application/json"
CONTENT_JSON="Content-Type: application/json"
ACCEPT_CSV="Accept: text/csv"
CONTENT_CSV="Content-Type: text/csv"

BASIC_AUTH="Authorization: Basic OTTdJdDktBY0Vhk5OTpjO"
# HEADER_AUTH=--header "$BASIC_AUTH"
HEADER_AUTH=

URL=$WEB_SERVER/javaee7-angular/resources

curl -i -X GET --header "$ACCEPT_JSON" $HEADER_AUTH $URL/persons
curl -i -X GET --header "$ACCEPT_JSON" $HEADER_AUTH $URL/persons/1
curl -i -X POST --header "$CONTENT_JSON" --header "$ACCEPT_JSON" $HEADER_AUTH -d @person_for_POST.json $URL/persons
curl -i -X DELETE $HEADER_AUTH $URL/persons/1
