# Dockerfile for building a EGI FedCloud userinterface
FROM egifedcloud/fedcloud-coretools
MAINTAINER Enol Fernandez <enol.fernandez@egi.eu>

# gain privileges
USER root

# extra tools for docker image
RUN apt-get -y install openssh-client vim nano less

# and get back to unprivileged user
USER occi

CMD /bin/bash
