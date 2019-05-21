FROM debian:jessie-slim

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION

LABEL \
    org.label-schema.vendor="The Goofball - goofball222@gmail.com" \
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
    JVM_EXTRA_OPTS= \
    JVM_INIT_HEAP_SIZE= \
    JVM_MAX_HEAP_SIZE=1024M \
    PGID=999 \
    PUID=999 \
    RUN_CHOWN=true \
    RUNAS_UID0=false

WORKDIR /usr/lib/unifi

COPY root /

RUN set -x \
    && groupadd -r unifi -g $PGID \
    && useradd --no-log-init -r -u $PUID -g $PGID unifi \
    && mkdir /usr/share/man/man1 \
    && echo "deb http://archive.debian.org/debian jessie-backports main" \
        > /etc/apt/sources.list.d/jessie-backports.list \
    && apt-get -o Acquire::Check-Valid-Until=false -qqy update > /dev/null \
    && apt-get -qqy --no-install-recommends install \
        binutils \
        curl \
        gosu > /dev/null \
    && apt-get -qqy -t jessie-backports --no-install-recommends install \
        ca-certificates-java \
        openjdk-8-jre-headless > /dev/null \
    && curl -sSL https://dl.ubnt.com/unifi/${VERSION}/unifi_sysvinit_all.deb -o /tmp/unifi-${VERSION}.deb \
    && apt-get -qqy autoremove --purge > /dev/null \
    && apt-get -qqy clean autoclean > /dev/null \
    && dpkg --force-all -i /tmp/unifi-${VERSION}.deb \
    && bash -c 'mkdir -p {data,logs,run,cert}' \
    && chown -R unifi:unifi /usr/lib/unifi \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/log/*

EXPOSE 3478/udp 6789/tcp 8080/tcp 8443/tcp 8843/tcp 8880/tcp 10001/udp

VOLUME ["/usr/lib/unifi/cert", "/usr/lib/unifi/data", "/usr/lib/unifi/logs"]

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["unifi"]
