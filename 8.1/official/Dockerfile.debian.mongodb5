FROM debian:bullseye-slim

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION

LABEL \
    org.opencontainers.image.vendor="The Goofball - goofball222@gmail.com" \
    org.opencontainers.image.url="https://github.com/goofball222/unifi" \
    org.opencontainers.image.title="UniFi Controller" \
    org.opencontainers.image.description="UniFi Controller" \
    org.opencontainers.image.version=${VERSION}-Debian \
    org.opencontainers.image.source="https://github.com/goofball222/unifi" \
    org.opencontainers.image.revision=${VCS_REF} \
    org.opencontainers.image.created=${BUILD_DATE} \
    org.opencontainers.image.licenses="Apache-2.0"

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
    && mkdir -p /usr/share/man/man1 \
    && apt-get -qqy update \
    && apt-get -qqy install apt-utils \
    && apt-get -qqy --no-install-recommends install \
        dirmngr gnupg2 > /dev/null \
    && apt-get -qqy update \
    && apt-get -qqy --no-install-recommends install \
        binutils curl gosu \
        libcap2 libcap2-bin procps > /dev/null \
    && apt-get -qqy --no-install-recommends install \
        ca-certificates-java > /dev/null \
    && apt-get -qqy --no-install-recommends install \
        openjdk-17-jre-headless > /dev/null \
    && curl -fsSL https://pgp.mongodb.com/server-5.0.asc | \
        gpg -o /usr/share/keyrings/mongodb-server-5.0.gpg \
        --dearmor \
    && echo "deb [ signed-by=/usr/share/keyrings/mongodb-server-5.0.gpg] http://repo.mongodb.org/apt/debian bullseye/mongodb-org/5.0 main" \
        > /etc/apt/sources.list.d/mongodb-org-5.0.list \
    && apt-get -qqy update \
    && apt-get -qqy --no-install-recommends install \
        mongodb-org-server > /dev/null \
    && curl -sSL https://dl.ui.com/unifi/${VERSION}/unifi_sysvinit_all.deb -o /tmp/unifi-${VERSION}.deb \
    && apt-get -qqy purge \
        apt-utils dirmngr gnupg2 > /dev/null \
    && apt-get -qqy autoremove --purge > /dev/null \
    && apt-get -qqy clean autoclean > /dev/null \
    && dpkg --force-all -i /tmp/unifi-${VERSION}.deb \
    && rm -rf data logs run \
    && bash -c 'mkdir -p {data,logs,run,cert}' \
    && chown -R unifi:unifi /usr/lib/unifi \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/log/*

EXPOSE 3478/udp 6789/tcp 8080/tcp 8443/tcp 8843/tcp 8880/tcp 10001/udp

VOLUME ["/usr/lib/unifi/cert", "/usr/lib/unifi/data", "/usr/lib/unifi/logs"]

HEALTHCHECK --start-period=2m CMD /usr/local/bin/docker-healthcheck.sh

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["unifi"]
