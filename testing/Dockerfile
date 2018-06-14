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
    && useradd --no-log-init -r -u $MONGO_UID -g $MONGO_GID mongodb \
    && groupadd -r unifi -g $UNIFI_GID \
    && useradd --no-log-init -r -u $UNIFI_UID -g $UNIFI_GID unifi \
    && mkdir /usr/share/man/man1 \
    && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6 > /dev/null \
    && echo "deb http://repo.mongodb.org/apt/debian jessie/mongodb-org/3.4 main" \
        > /etc/apt/sources.list.d/mongodb-org-3.4.list \
    && echo "deb http://ftp.debian.org/debian jessie-backports main" \
        > /etc/apt/sources.list.d/jessie-backports.list \
    && apt-get -qqy update > /dev/null \
    && apt-get -qqy --no-install-recommends install \
        binutils \
        curl > /dev/null \
    && apt-get -qqy -t jessie-backports --no-install-recommends install \
        ca-certificates-java \
        openjdk-8-jre-headless > /dev/null \
    && apt-get -qqy --no-install-recommends install \
        mongodb-org-server > /dev/null \
    # Add gosu - easy step-down from uid 0 for running app
    && dpkgArch="$(dpkg --print-architecture | awk -F- '{ print $NF }')" \
    && curl -sSL https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch -o /usr/local/bin/gosu \
    && curl -sSL https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch.asc -o /usr/local/bin/gosu.asc \
    && export GNUPGHOME="$(mktemp -d)" \
    # Verify the gosu signature
    && gpg --keyserver ha.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4 \
    && gpg --batch --verify /usr/local/bin/gosu.asc /usr/local/bin/gosu \
    && rm -r "$GNUPGHOME" /usr/local/bin/gosu.asc \
    && chmod +x /usr/local/bin/gosu \
    # Verify that the gosu binary works
    && gosu nobody true \
    && curl -sSL https://dl.ubnt.com/unifi/$VERSION/unifi_sysvinit_all.deb -o /tmp/unifi.deb \
    && apt-get -qqy purge curl > /dev/null \
    && apt-get -qqy autoremove --purge > /dev/null \
    && apt-get -qqy clean autoclean > /dev/null \
    && dpkg --force-all -i /tmp/unifi.deb \
    && rm /tmp/unifi.deb \
    && bash -c 'mkdir -p {data,logs,run,cert}' \
    && chown -R unifi:unifi /usr/lib/unifi \
    && rm -rf /var/cache/apt/* /var/cache/debconf/* /var/lib/apt/* /var/lib/dpkg/* /tmp/* /var/tmp/* /var/log/*

EXPOSE 3478/udp 6789/tcp 8080/tcp 8443/tcp 8843/tcp 8880/tcp 10001/udp

VOLUME ["/usr/lib/unifi/cert", "/usr/lib/unifi/data", "/usr/lib/unifi/logs"]

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["unifi"]
