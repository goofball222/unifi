FROM frolvlad/alpine-glibc:latest

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
    && delgroup ping \
    && addgroup -g $PGID unifi \
    && adduser -D -G unifi -u $PUID unifi \
    && apk add -q --no-cache \
        bash binutils coreutils curl libcap \
        mongodb openjdk8-jre openssl shadow su-exec \
        tzdata \
    && curl -sSL https://dl.ubnt.com/unifi/${VERSION}/UniFi.unix.zip -o /tmp/UniFi.unix.${VERSION}.zip \
    && unzip -q /tmp/UniFi.unix.${VERSION}.zip -d /tmp \
    && mv /tmp/UniFi/* /usr/lib/unifi/ \
    && bash -c 'mkdir -p {data,logs,run,cert}' \
    && chown -R unifi:unifi /usr/lib/unifi \
    && rm /usr/lib/unifi/bin/mongod \
    && ln -s /usr/bin/mongod /usr/lib/unifi/bin/mongod \
    && rm -rf /tmp/* /var/tmp/* /var/cache/apk/*

EXPOSE 3478/udp 6789/tcp 8080/tcp 8443/tcp 8843/tcp 8880/tcp 10001/udp

VOLUME ["/usr/lib/unifi/cert", "/usr/lib/unifi/data", "/usr/lib/unifi/logs"]

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["unifi"]
