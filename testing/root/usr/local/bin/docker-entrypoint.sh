#!/usr/bin/env bash

# docker-entrypoint.sh script for UniFi Docker container.
# License: Apache-2.0
# Github: https://github.com/goofball222/unifi
SCRIPT_VERSION="0.4.6"
# Last updated date: 2017-09-21

if [ "${DEBUG}" == 'true' ]; then
    set -xEeuo pipefail
else
    set -Eeuo pipefail
fi

echo "$(date +"[%Y-%m-%d %T,%3N]") Script version ${SCRIPT_VERSION} startup."
echo "$(date +"[%Y-%m-%d %T,%3N]") Setting params/variables/paths."

BASEDIR="/usr/lib/unifi"
CERTDIR=${BASEDIR}/cert
DATADIR=${BASEDIR}/data
LOGDIR=${BASEDIR}/logs
RUNDIR=${BASEDIR}/run

[ ! -z "${JVM_MAX_HEAP_SIZE}" ] && JVM_EXTRA_OPTS="${JVM_EXTRA_OPTS} -Xmx${JVM_MAX_HEAP_SIZE}"
[ ! -z "${JVM_INIT_HEAP_SIZE}" ] && JVM_EXTRA_OPTS="${JVM_EXTRA_OPTS} -Xms${JVM_INIT_HEAP_SIZE}"

JVM_EXTRA_OPTS="${JVM_EXTRA_OPTS} -Dunifi.datadir=${DATADIR} -Dunifi.logdir=${LOGDIR} -Dunifi.rundir=${RUNDIR}"

JVM_OPTS="${JVM_EXTRA_OPTS} -Djava.awt.headless=true -Dfile.encoding=UTF-8"

cd ${BASEDIR}

# system.properties container mode setup (echo logs to STDOUT, support ENV read)
echo "$(date +"[%Y-%m-%d %T,%3N]") Validating system.properties setup for container."
if [ ! -e ${DATADIR}/system.properties ]; then
    echo "$(date +"[%Y-%m-%d %T,%3N]") '${DATADIR}/system.properties' doesn't exist. Copying from '${BASEDIR}/system.properties.default'."
    cp ${BASEDIR}/system.properties.default ${DATADIR}/system.properties
else
    echo "$(date +"[%Y-%m-%d %T,%3N]") Existing '${DATADIR}/system.properties' found. Setting its container-mode options to 'true'."
    if ! grep -q "unifi.logStdout" "${DATADIR}/system.properties"; then
        echo "unifi.logStdout=true" >> ${DATADIR}/system.properties
    else
        sed -i '/unifi.logStdout/c\unifi.logStdout=true' ${DATADIR}/system.properties
    fi

    if ! grep -q "unifi.config.readEnv" "${DATADIR}/system.properties"; then
        echo "unifi.config.readEnv=true" >> ${DATADIR}/system.properties
    else
        sed -i '/unifi.config.readEnv/c\unifi.config.readEnv=true' ${DATADIR}/system.properties
    fi
fi
# End system.properties container mode setup

# SSL certificate setup
if [ -e ${CERTDIR}/privkey.pem ] && [ -e ${CERTDIR}/fullchain.pem ]; then
    if `/usr/bin/sha256sum -c ${CERTDIR}/unificert.sha256 &> /dev/null`; then
        echo "$(date +"[%Y-%m-%d %T,%3N]") SSL certificate file unchanged. Continuing with UniFi startup."
        echo "$(date +"[%Y-%m-%d %T,%3N]") To force retry the SSL import process: delete '${CERTDIR}/unificert.sha256' and restart the container."
    else
        if [ ! -e ${DATADIR}/keystore ]; then
            echo "$(date +"[%Y-%m-%d %T,%3N]") SSL keystore does not exist. Generating it with Java keytool."
            keytool -genkey -keyalg RSA -alias unifi -keystore ${DATADIR}/keystore \
            -storepass aircontrolenterprise -keypass aircontrolenterprise -validity 1825 \
            -keysize 4096 -dname "cn=UniFi"
        else
            echo "$(date +"[%Y-%m-%d %T,%3N]") SSL keystore present."
            echo "$(date +"[%Y-%m-%d %T,%3N]") Backup existing '${DATADIR}/keystore' to '${DATADIR}/keystore-$(date +%s)'."
            cp ${DATADIR}/keystore ${DATADIR}/keystore-$(date +%s)
        fi
        echo "$(date +"[%Y-%m-%d %T,%3N]") Starting SSL certificate keystore update."
        echo "$(date +"[%Y-%m-%d %T,%3N]") OpenSSL: combine new private key and certificate chain into temporary PKCS12 file."
        openssl pkcs12 -export \
            -inkey ${CERTDIR}/privkey.pem \
            -in ${CERTDIR}/fullchain.pem \
            -out ${CERTDIR}/certtemp.p12 \
            -name ubnt -password pass:temppass

        echo "$(date +"[%Y-%m-%d %T,%3N]") Java keytool: import PKCS12 '${CERTDIR}/certtemp.p12' file into '${DATADIR}/keystore'."
        keytool -importkeystore -deststorepass aircontrolenterprise \
         -destkeypass aircontrolenterprise -destkeystore ${DATADIR}/keystore \
         -srckeystore ${CERTDIR}/certtemp.p12 -srcstoretype PKCS12 \
         -srcstorepass temppass -alias ubnt -noprompt

        echo "$(date +"[%Y-%m-%d %T,%3N]") Removing temporary PKCS12 file."
        rm ${CERTDIR}/certtemp.p12

        echo "$(date +"[%Y-%m-%d %T,%3N]") Storing SHA256 hash of private key and certificate file to identify future changes."
        /usr/bin/sha256sum ${CERTDIR}/privkey.pem > ${CERTDIR}/unificert.sha256
        /usr/bin/sha256sum ${CERTDIR}/fullchain.pem >> ${CERTDIR}/unificert.sha256

        echo "$(date +"[%Y-%m-%d %T,%3N]") Completed updating SSL certificate in '${DATADIR}/keystore'. Continuing regular startup."
        echo "$(date +"[%Y-%m-%d %T,%3N]") Check above ***this*** line for error messages if your SSL certificate import isn't working."
        echo "$(date +"[%Y-%m-%d %T,%3N]") To force retry the SSL import process: delete '${CERTDIR}/unificert.sha256' and restart the container."
    fi
else
    [ -f ${CERTDIR}/privkey.pem ] || echo "$(date +"[%Y-%m-%d %T,%3N]") Missing '${CERTDIR}/privkey.pem', cannot update SSL certificate in '${DATADIR}/keystore'."
    [ -f ${CERTDIR}/fullchain.pem ] || echo "$(date +"[%Y-%m-%d %T,%3N]") Missing '${CERTDIR}/fullchain.pem', cannot update SSL certificate in '${DATADIR}/keystore'."
    echo "$(date +"[%Y-%m-%d %T,%3N]") Custom SSL certificate import was NOT performed."
fi
# End SSL certificate setup

# Application run setup
if [ "$(id -u)" = '0' ]; then
    echo "$(date +"[%Y-%m-%d %T,%3N]") Entrypoint running with UID=0."
    if [ "$(id unifi -u)" != "${UNIFI_UID}" ] || [ "$(id unifi -g)" != "${UNIFI_GID}" ]; then
        echo "$(date +"[%Y-%m-%d %T,%3N]") Setting custom unifi UID/GID: UID=${UNIFI_UID}, GID=${UNIFI_GID}"
        usermod -u ${UNIFI_UID} unifi && groupmod -g ${UNIFI_GID} unifi
    else
        echo "$(date +"[%Y-%m-%d %T,%3N]") UID/GID for unifi are unchanged: UID=${UNIFI_UID}, GID=${UNIFI_GID}"
    fi

    echo "$(date +"[%Y-%m-%d %T,%3N]") Ensuring file permissions are correct before dropping privs - 'chown -R unifi:unifi ${BASEDIR}'."
    chown -R unifi:unifi /usr/lib/unifi

    if [[ "${@}" == 'unifi' ]]; then
        if [ "${BIND_PRIV}" == 'true' ]; then
            echo "$(date +"[%Y-%m-%d %T,%3N]") Support binding ports <1024 'setcap 'cap_net_bind_service=+ep' /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java'."
            setcap 'cap_net_bind_service=+ep' /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java
        fi

        echo "$(date +"[%Y-%m-%d %T,%3N]") -- EXEC: gosu unifi:unifi /usr/bin/java ${JVM_OPTS} -jar ${BASEDIR}/lib/ace.jar start"
        exec gosu unifi:unifi /usr/bin/java ${JVM_OPTS} -jar ${BASEDIR}/lib/ace.jar start
    else
        echo "$(date +"[%Y-%m-%d %T,%3N]") -- EXEC: ${@} as UID=0"
        exec "${@}"
    fi
else
    echo "$(date +"[%Y-%m-%d %T,%3N]") Entrypoint not started as UID 0."
    echo "$(date +"[%Y-%m-%d %T,%3N]") Unable to change permissions or set custom UID/GID if configured. Requested CMD may not work."
    if [[ "${@}" == 'unifi' ]]; then
        echo "$(date +"[%Y-%m-%d %T,%3N]") -- EXEC: /usr/bin/java ${JVM_OPTS} -jar ${BASEDIR}/lib/ace.jar start"
        exec /usr/bin/java ${JVM_OPTS} -jar ${BASEDIR}/lib/ace.jar start
    else
        echo "$(date +"[%Y-%m-%d %T,%3N]") -- EXEC: ${@}"
        exec "${@}"
    fi
fi
# End application run setup
