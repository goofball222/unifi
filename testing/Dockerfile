FROM debian:jessie-slim
MAINTAINER The Goofball "goofball222@gmail.com"

ENV DEBIAN_FRONTEND=noninteractive

ARG BUILD_DATE
ARG VCS_REF
ARG UNIFI_VERSION

LABEL org.label-schema.vendor=goofball222 \
      org.label-schema.url="https://github.com/goofball222/unifi" \
      org.label-schema.name="UniFi Controller" \
      org.label-schema.license="Apache-2.0" \
      org.label-schema.version=$UNIFI_VERSION \
      org.label-schema.vcs-url="https://github.com/goofball222/unifi" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.schema-version="1.0"

# Add apt repository keys, non-default sources, update apt database to load new data
# Install deps and mongodb, download unifi .deb, install and remove package
# Cleanup after apt to minimize final image size
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 > /dev/null && \
  echo "deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen" \
    > /etc/apt/sources.list.d/mongodb.list && \
  echo "deb http://ftp.debian.org/debian jessie-backports main" \
    > /etc/apt/sources.list.d/jessie-backports.list && \
  apt-get -qqy update > /dev/null && \
  apt-get -qqy --no-install-recommends install \
    binutils \
    curl > /dev/null && \
  mkdir /usr/share/man/man1 && \
  apt-get -qqy -t jessie-backports --no-install-recommends install \
    ca-certificates-java \
    openjdk-8-jre-headless \
    jsvc > /dev/null && \
  apt-get -qqy --no-install-recommends install \
    mongodb-server > /dev/null && \
  curl -sSOL https://www.ubnt.com/downloads/unifi/$UNIFI_VERSION/unifi_sysvinit_all.deb && \
  dpkg --install unifi_sysvinit_all.deb && \
  rm unifi_sysvinit_all.deb && \
  apt-get -qqy autoremove --purge curl > /dev/null && \
  apt-get -qqy autoclean > /dev/null && \
  apt-get -qqy clean > /dev/null && \
  rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*.deb /tmp/* /var/tmp/*

# Forward apporpriate ports
EXPOSE 3478/udp 6789/tcp 8080/tcp 8443/tcp 8843/tcp 8880/tcp 10001/udp

# Set internal storage volume
VOLUME ["/usr/lib/unifi/cert", "/usr/lib/unifi/data", "/usr/lib/unifi/logs"]

# Set UniFi, Java and JSVC defaults for unifi-init, can be changed at container launch with command line --env parameters
ENV DEBUG=false \
    JAVA_ENTROPY_GATHER_DEVICE= \
    JVM_MAX_HEAP_SIZE=1024M \
    JVM_INIT_HEAP_SIZE= \
    JVM_MAX_THREAD_STACK_SIZE= \
    JVM_EXTRA_OPTS= \
    JSVC_EXTRA_OPTS= \
    UNIFI_JVM_EXTRA_OPTS=

# Add unifi-init.sh script, set it to executable
ADD unifi-init /usr/local/bin/
RUN chmod +x /usr/local/bin/unifi-init

# Set working directory for program
WORKDIR /usr/lib/unifi

ENTRYPOINT ["/usr/local/bin/unifi-init"]
