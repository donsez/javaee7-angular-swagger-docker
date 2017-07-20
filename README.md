Simple container for JavaEE7 demonstration.

Description
===========

The Wildfly JavaEE7 serves :
* a RESTFul service
* a simple AngularJS application
* the Swagger UI and an 1-page HTML documentation

Usage
=====

First, install Java (JDK), Maven and Docker.
```
 ./build.sh
 ./curl.sh
```
Exercices
=========

* REST Testing with REST Assured http://rest-assured.io/
* Load injection with Gatlings
* Monitoring with Hawkular
* External Database (MySQL/MariaDB container)
* HA Database backend (Replicated MySQL/MariaDB)
* Opentracing
* Distributed tracing with Zipkin https://github.com/openzipkin/zipkin
* Load Balancing and SSL Termination with HAProxy https://hub.docker.com/_/haproxy/
* Firewall with UFW https://help.ubuntu.com/community/UFW and https://help.ubuntu.com/community/Gufw
