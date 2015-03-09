############################################################
# Dockerfile to build ARMhf HAProxy Installed Containers
# Based on armv7/armhf-ubuntu
# Supports SSL
############################################################

FROM armv7/armhf-ubuntu

MAINTAINER Troy Fontaine

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
VOLUME ["/haproxy-override","/etc/ssl/"]

# Define working directory.
WORKDIR /etc/haproxy

# Define default command.
CMD ["bash", "/haproxy-start"]

# Expose ports.
EXPOSE 80 443
