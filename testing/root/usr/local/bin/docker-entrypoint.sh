#!/usr/bin/env bash

# docker-entrypoint.sh script for UniFi Docker container
# License: Apache-2.0
# Github: https://github.com/goofball222/unifi
SCRIPT_VERSION="0.5.7"
# Last updated date: 2018-05-03

set -Eeuo pipefail

if [ "${DEBUG}" == 'true' ]; then
    set -x
fi

BASEDIR="/usr/lib/unifi"
CERTDIR=${BASEDIR}/cert
DATADIR=${BASEDIR}/data
LOGDIR=${BASEDIR}/logs
RUNDIR=${BASEDIR}/run

log() {
    echo "$(date +"[%Y-%m-%d %T,%3N]") <docker-entrypoint> $*" | tee -a ${BASEDIR}/logs/server.log
}

log "INFO - Script version ${SCRIPT_VERSION}"

[ ! -z "${JVM_MAX_HEAP_SIZE}" ] && JVM_EXTRA_OPTS="${JVM_EXTRA_OPTS} -Xmx${JVM_MAX_HEAP_SIZE}"
[ ! -z "${JVM_INIT_HEAP_SIZE}" ] && JVM_EXTRA_OPTS="${JVM_EXTRA_OPTS} -Xms${JVM_INIT_HEAP_SIZE}"

JVM_EXTRA_OPTS="${JVM_EXTRA_OPTS} -Dunifi.datadir=${DATADIR} -Dunifi.logdir=${LOGDIR} -Dunifi.rundir=${RUNDIR}"

JVM_OPTS="${JVM_EXTRA_OPTS} -Djava.awt.headless=true -Dfile.encoding=UTF-8"

cd ${BASEDIR}

# system.properties container mode setup (echo logs to STDOUT, support ENV read)
log "INFO - Checking system.properties setup for container"
if [ ! -e ${DATADIR}/system.properties ]; then
    log "INFO - '${DATADIR}/system.properties' doesn't exist, copying from '${BASEDIR}/system.properties.default'"
    cp ${BASEDIR}/system.properties.default ${DATADIR}/system.properties
else
    log "INFO - Existing '${DATADIR}/system.properties' found, ensuring container mode options are enabled"
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
        log "INFO - SSL: certificate files unchanged, continuing with UniFi startup"
        log "INFO - SSL: To force rerun import process: delete '${CERTDIR}/unificert.sha256' and restart the container"
    else
        if [ ! -e ${DATADIR}/keystore ]; then
            log "WARN - SSL: keystore does not exist, generating it with Java keytool"
            keytool -genkey -keyalg RSA -alias unifi -keystore ${DATADIR}/keystore \
            -storepass aircontrolenterprise -keypass aircontrolenterprise -validity 1825 \
            -keysize 4096 -dname "cn=UniFi"
        else
            log "INFO - SSL: backup existing '${DATADIR}/keystore' to '${DATADIR}/keystore-$(date +%s)'"
            cp ${DATADIR}/keystore ${DATADIR}/keystore-$(date +%s)
        fi
        log "INFO - SSL: custom certificate keystore update"
        log "INFO - SSL: openssl combine custom private key and certificate chain into temporary PKCS12 file"
        openssl pkcs12 -export \
            -inkey ${CERTDIR}/privkey.pem \
            -in ${CERTDIR}/fullchain.pem \
            -out ${CERTDIR}/certtemp.p12 \
            -name unifi -password pass:temppass

        log "INFO - SSL: Java keytool import PKCS12 '${CERTDIR}/certtemp.p12' file into '${DATADIR}/keystore'"
        keytool -importkeystore -deststorepass aircontrolenterprise \
         -destkeypass aircontrolenterprise -destkeystore ${DATADIR}/keystore \
         -srckeystore ${CERTDIR}/certtemp.p12 -srcstoretype PKCS12 \
         -srcstorepass temppass -alias unifi -noprompt

        log "INFO - SSL: Removing temporary PKCS12 file"
        rm ${CERTDIR}/certtemp.p12

        log "INFO - SSL: Store SHA256 hash of private key and certificate file"
        /usr/bin/sha256sum ${CERTDIR}/privkey.pem > ${CERTDIR}/unificert.sha256
        /usr/bin/sha256sum ${CERTDIR}/fullchain.pem >> ${CERTDIR}/unificert.sha256

        log "INFO - SSL: completed update of custom certificate in '${DATADIR}/keystore'"
        log "INFO - SSL: Check above ***here*** for errors if your custom certificate import isn't working"
        log "INFO - SSL: To force rerun import process: delete '${CERTDIR}/unificert.sha256' and restart the container"
    fi
else
    [ -f ${CERTDIR}/privkey.pem ] || log "WARN - SSL: missing '${CERTDIR}/privkey.pem', cannot update certificate in '${DATADIR}/keystore'"
    [ -f ${CERTDIR}/fullchain.pem ] || log "WARN - SSL: missing '${CERTDIR}/fullchain.pem', cannot update certificate in '${DATADIR}/keystore'"
    log "WARN - SSL: certificate import was NOT performed"
fi
# End SSL certificate setup

# Application run setup
exit_handler() {
    log "INFO - Exit signal received, commencing shutdown"
    exec /usr/bin/java ${JVM_OPTS} -jar ${BASEDIR}/lib/ace.jar stop &
    for i in `seq 0 9`; do
        [ -z "$(pgrep -f ${BASEDIR}/lib/ace.jar)" ] && break
        # graceful shutdown
        [ $i -gt 0 ] && [ -d ${RUNDIR} ] && touch ${RUNDIR}/server.stop || true
        # savage shutdown
        [ $i -gt 6 ] && pkill -f ${BASEDIR}/lib/ace.jar || true
        sleep 1
    done
    log "INFO - Shutdown complete. Nothing more to see here. Have a nice day!"
    log "INFO - Exit with status code ${?}"
    exit ${?};
}

trap 'kill ${!}; exit_handler' SIGHUP SIGINT SIGQUIT SIGTERM

# Wait indefinitely on tail until killed
idle_handler() {
    while true
    do
        tail -f /dev/null & wait ${!}
    done
}

if [ "$(id -u)" = '0' ]; then
    log "INFO - Entrypoint running with UID 0 (root)"
    if [ "$(id unifi -u)" != "${UNIFI_UID}" ] || [ "$(id unifi -g)" != "${UNIFI_GID}" ]; then
        log "INFO - Setting custom unifi UID/GID: UID=${UNIFI_UID}, GID=${UNIFI_GID}"
        usermod -u ${UNIFI_UID} unifi && groupmod -g ${UNIFI_GID} unifi
    else
        log "INFO - UID/GID for unifi are unchanged: UID=${UNIFI_UID}, GID=${UNIFI_GID}"
    fi

    log "INFO - Ensuring file permissions are correct before dropping privs - 'chown -R unifi:unifi ${BASEDIR}'"
    chown -R unifi:unifi ${BASEDIR}

    if [[ "${@}" == 'unifi' ]]; then

        if [ "${BIND_PRIV}" == 'true' ] && [ "${RUNAS_UID0}" == 'false' ]; then
            log "INFO - Support binding ports <1024 'setcap 'cap_net_bind_service=+ep' /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java'"
            if setcap 'cap_net_bind_service=+ep' /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java; then
                sleep 1
            else
                log "ERROR - BIND_PRIV = 'true' and 'setcap' command failed on this Docker host"
                log "ERROR - If binding ports <1024 required on this Docker host use RUNAS_UID0=true instead"
                log "ERROR - Container run state is invalid, exiting..."
                exit 1;
            fi
        fi

        if [ "${RUNAS_UID0}" == 'true' ]; then
            log "INFO - RUNAS_UID0 = 'true', running UniFi processes as UID 0 (root)"
            log "WARN - ======================================================================"
            log "WARN - *** Running as UID 0 (root) is an insecure configuration ***"
            log "WARN - ======================================================================"
            log "EXEC - /usr/bin/java ${JVM_OPTS} -jar ${BASEDIR}/lib/ace.jar start"
            exec /usr/bin/java ${JVM_OPTS} -jar ${BASEDIR}/lib/ace.jar start &
            idle_handler
        fi

        log "INFO - Use gosu to drop privileges and start Java/UniFi as UID=${UNIFI_UID}, GID=${UNIFI_GID}"
        log "EXEC - gosu unifi:unifi /usr/bin/java ${JVM_OPTS} -jar ${BASEDIR}/lib/ace.jar start"
        exec gosu unifi:unifi /usr/bin/java ${JVM_OPTS} -jar ${BASEDIR}/lib/ace.jar start &
        idle_handler
    else
        log "EXEC - ${@} as UID 0 (root)"
        exec "${@}"
    fi
else
    log "WARN - Container/entrypoint not started as UID 0 (root)"
    log "WARN - Unable to change permissions or set custom UID/GID if configured"
    log "WARN - Process will be spawned with UID=$(id -u), GID=$(id -g)"
    log "WARN - Depending on permissions requested command may not work"
    if [[ "${@}" == 'unifi' ]]; then
        log "EXEC - /usr/bin/java ${JVM_OPTS} -jar ${BASEDIR}/lib/ace.jar start"
        exec /usr/bin/java ${JVM_OPTS} -jar ${BASEDIR}/lib/ace.jar start &
        idle_handler
    else
        log "EXEC - ${@}"
        exec "${@}"
    fi
fi
# End application run setup

# Script should never make it here, but just in case exit with a generic error code if it does
exit 1;
