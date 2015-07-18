############################################################
# Dockerfile to build ARMhf HAProxy Installed Containers
# Based on armv7/armhf-ubuntu:14.10
# Supports SSL - HAProxy Version 1.5.4
# Version: 1.2 - July 16, 2015
############################################################

FROM armv7/armhf-ubuntu:14.10

MAINTAINER Troy Fontaine

#ENV DEBIAN_FRONTEND noninteractive

# Install Haproxy
RUN \
  apt-get update && \
  apt-get install -y haproxy && \
  sed -i 's/^ENABLED=.*/ENABLED=1/' /etc/default/haproxy && \
  mkdir /etc/ssl/ && \
  rm -rf /var/lib/apt/lists/*

# Add Files
ADD haproxy.cfg /etc/haproxy/haproxy.cfg
ADD start.bash /haproxy-start

# Define mountable directories.
VOLUME ["/haproxy-override","/etc/ssl"]

# Define working directory.
WORKDIR /etc/haproxy

# Define default command.
CMD ["bash", "/haproxy-start"]

# Expose ports.
EXPOSE 80 443
