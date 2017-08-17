FROM debian:jessie-slim
MAINTAINER The Goofball "goofball222@gmail.com"

ENV DEBIAN_FRONTEND=noninteractive

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION

LABEL \
    org.label-schema.vendor=goofball222 \
    org.label-schema.url="https://github.com/goofball222/unifi" \
    org.label-schema.name="UniFi Controller" \
    org.label-schema.version=$VERSION \
    org.label-schema.vcs-url="https://github.com/goofball222/unifi.git" \
    org.label-schema.vcs-ref=$VCS_REF \
    org.label-schema.build-date=$BUILD_DATE \
    org.label-schema.license="Apache-2.0" \
    org.label-schema.schema-version="1.0"

RUN \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 > /dev/null && \
    echo "deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen" \
        > /etc/apt/sources.list.d/mongodb.list && \
    echo "deb http://ftp.debian.org/debian jessie-backports main" \
        > /etc/apt/sources.list.d/jessie-backports.list && \
    apt-get -qqy update > /dev/null && \
    apt-get -qqy --no-install-recommends install \
        supervisor \
        binutils \
        curl > /dev/null && \
    mkdir /usr/share/man/man1 && \
    apt-get -qqy -t jessie-backports --no-install-recommends install \
        ca-certificates-java \
        openjdk-8-jre-headless \
        jsvc > /dev/null && \
    apt-get -qqy --no-install-recommends install \
        mongodb-server > /dev/null && \
    curl -sSOL https://www.ubnt.com/downloads/unifi/$VERSION/unifi_sysvinit_all.deb && \
    dpkg --install unifi_sysvinit_all.deb && \
    rm unifi_sysvinit_all.deb && \
    apt-get -qqy purge curl && \
    apt-get -qqy autoremove --purge > /dev/null && \
    apt-get -qqy clean autoclean > /dev/null && \
    rm -rf /var/cache/apt/* /var/cache/debconf/* /var/lib/apt/* /var/lib/dpkg/* /tmp/* /var/tmp/* /var/log/*

EXPOSE 3478/udp 6789/tcp 8080/tcp 8443/tcp 8843/tcp 8880/tcp 10001/udp

VOLUME ["/usr/lib/unifi/data", "/usr/lib/unifi/logs"]

WORKDIR /usr/lib/unifi

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

ENTRYPOINT ["/usr/bin/supervisord"]

CMD ["-c", "/etc/supervisor/conf.d/supervisord.conf"]
