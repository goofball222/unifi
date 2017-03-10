# Build Docker image to run the UniFi controller
#
FROM debian:jessie
MAINTAINER The Goofball goofball222@gmail.com

# Set environment variables
ENV DEBIAN_FRONTEND noninteractive
ENV UNIFI_VERSION 5.5.7-0cbda0cd4a

# Add apt repository keys, non-default sources, update apt database to load new data
# Install deps and mongodb, download unifi .deb, install and remove package
# Cleanup after apt to minimize image size
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 && \
  echo "deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen" \
    | tee -a /etc/apt/sources.list.d/mongodb.list && \
  echo "deb http://ftp.debian.org/debian jessie-backports main" \
    | tee -a /etc/apt/sources.list.d/jessie-backports.list && \
  apt-get update -q && \
  apt-get --no-install-recommends -y install \
    supervisor \
    binutils \
    wget && \
  apt-get -t jessie-backports --no-install-recommends -y install \
    openjdk-8-jre-headless && \
  apt-get --no-install-recommends -y install \
    jsvc \
    mongodb-server && \
  wget -nv https://www.ubnt.com/downloads/unifi/$UNIFI_VERSION/unifi_sysvinit_all.deb && \
  dpkg --install unifi_sysvinit_all.deb && \
  rm unifi_sysvinit_all.deb && \
  apt-get -y autoremove wget && \
  apt-get -q clean && \
  rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*.deb /tmp/* /var/tmp/*

# Forward apporpriate ports
EXPOSE 3478/udp 6789/tcp 8080/tcp 8443/tcp 8843/tcp 8880/tcp 10001/udp

# Set internal storage volume
VOLUME ["/usr/lib/unifi/data", "/usr/lib/unifi/logs"]

# Set working directory for program
WORKDIR /usr/lib/unifi

#  Add supervisor config
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

CMD ["/usr/bin/supervisord"]
