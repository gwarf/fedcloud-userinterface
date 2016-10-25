# Dockerfile for building a EGI FedCloud userinterface
FROM ubuntu:xenial
MAINTAINER Enol Fernandez <enol.fernandez@egi.eu>

ADD fedcloud-ui.sh /tmp/fedcloud-ui.sh

RUN /tmp/fedcloud-ui.sh

# extra tools for docker image: myproxy 
RUN apt-get -y install myproxy
# and OpenStack CLI + VOMS
RUN apt-get -y install python-pip
RUN pip install openstack-voms-auth-type
RUN cat /etc/grid-security/certificates/*.pem >> $(python -m requests.certs)

RUN fetch-crl -v || true

WORKDIR /data

RUN useradd occi

RUN chown -R occi /etc/grid-security/certificates /data

USER occi

# /etc/grid-security/certificates keeps the CRLs
# /tmp keeps the proxy files
VOLUME [ "/etc/grid-security/certificates", "/tmp" ]
