FROM debian:stretch-slim
MAINTAINER The Goofball "goofball222@gmail.com"

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

ENV \
    BIND_PRIV=false \
    DEBIAN_FRONTEND=noninteractive \
    DEBUG=false \
    GOSU_VERSION=1.10 \
    JVM_EXTRA_OPTS= \
    JVM_INIT_HEAP_SIZE= \
    JVM_MAX_HEAP_SIZE=1024M \
    MONGO_GID=998 \
    MONGO_UID=998 \
    RUNAS_UID0=false \
    UNIFI_GID=999 \
    UNIFI_UID=999

WORKDIR /usr/lib/unifi

COPY root /

RUN set -x \
    && groupadd -r mongodb -g $MONGO_GID \
    && useradd --no-log-init -r -u $MONGO_UID -g $MONGO_GID mongodb -d /var/lib/mongodb -M -s /bin/false \
    && groupadd -r unifi -g $UNIFI_GID \
    && useradd --no-log-init -r -u $UNIFI_UID -g $UNIFI_GID unifi -d /var/lib/unifi -M -s /bin/false \
    && mkdir /usr/share/man/man1 \
    && apt-get -qqy update \
    && apt-get -qqy install apt-utils \
    && apt-get -qqy upgrade \
    && apt-get -qqy --no-install-recommends install \
        gnupg2 \
        dirmngr \
        binutils \
        procps \
        libcap2 \
        curl \
        gosu \
        jsvc \
        ca-certificates-java \
        openjdk-8-jre-headless \
        mongodb \
    && curl -sSL https://dl.ubnt.com/unifi/unifi-repo.gpg -o /etc/apt/trusted.gpg.d/unifi-repo.gpg \
    && curl -sSL https://dl.ubnt.com/unifi/$VERSION/unifi_sysvinit_all.deb -o /tmp/unifi.deb \
    && apt-get -qqy purge curl \
    && apt-get -qqy autoremove --purge \
    && apt-get -qqy clean autoclean \
    && dpkg --force-all -i /tmp/unifi.deb \
    && rm /tmp/unifi.deb \
    && bash -c 'mkdir -p {data,logs,run,cert}' \
    && chown -R unifi:unifi /usr/lib/unifi \
    && rm -rf /var/cache/apt/* /var/cache/debconf/* /tmp/* /var/tmp/* /var/log/*

EXPOSE 3478/udp 6789/tcp 8080/tcp 8443/tcp 8843/tcp 8880/tcp 10001/udp

VOLUME ["/usr/lib/unifi/cert", "/usr/lib/unifi/data", "/usr/lib/unifi/logs"]

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["unifi"]
