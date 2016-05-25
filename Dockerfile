# Dockerfile for building a EGI FedCloud userinterface
FROM ubuntu:xenial
MAINTAINER Enol Fernandez <enol.fernandez@egi.eu>

ADD fedcloud-ui.sh /tmp/fedcloud-ui.sh

RUN /tmp/fedcloud-ui.sh

RUN fetch-crl -v || true

WORKDIR /data

# /etc/grid-security/certificates keeps the CRLs
# /tmp keeps the proxy files
VOLUME [ "/etc/grid-security/certificates", "/tmp" ]
