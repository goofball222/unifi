#!/usr/bin/env bash

# docker-entrypoint.sh script for UniFi Docker container
# License: Apache-2.0
# Github: https://github.com/goofball222/unifi
SCRIPT_VERSION="1.0.7"
# Last updated date: 2019-01-26

set -Eeuo pipefail

if [ "${DEBUG}" == 'true' ]; then
    set -x
fi

. /usr/local/bin/entrypoint-functions.sh

BASEDIR="/usr/lib/unifi"
CERTDIR=${BASEDIR}/cert
DATADIR=${BASEDIR}/data
LOGDIR=${BASEDIR}/logs
RUNDIR=${BASEDIR}/run

f_log "INFO - Entrypoint script version ${SCRIPT_VERSION}"
f_log "INFO - Entrypoint functions version ${ENTRYPOINT_FUNCTIONS_VERSION}"

[ ! -z "${JVM_MAX_HEAP_SIZE}" ] && JVM_EXTRA_OPTS="${JVM_EXTRA_OPTS} -Xmx${JVM_MAX_HEAP_SIZE}"
[ ! -z "${JVM_INIT_HEAP_SIZE}" ] && JVM_EXTRA_OPTS="${JVM_EXTRA_OPTS} -Xms${JVM_INIT_HEAP_SIZE}"

JVM_EXTRA_OPTS="${JVM_EXTRA_OPTS} -Dunifi.datadir=${DATADIR} -Dunifi.logdir=${LOGDIR} -Dunifi.rundir=${RUNDIR}"

JVM_OPTS="${JVM_EXTRA_OPTS} -Djava.awt.headless=true -Dfile.encoding=UTF-8"

cd ${BASEDIR}

f_exit_handler() {
    f_log "INFO - Exit signal received, commencing shutdown"
    exec /usr/bin/java ${JVM_OPTS} -jar ${BASEDIR}/lib/ace.jar stop &
    for i in `seq 0 25`; do
        [ -z "$(pgrep -f ${BASEDIR}/lib/ace.jar)" ] && break
        # graceful shutdown
        [ $i -gt 0 ] && [ -d ${RUNDIR} ] && touch ${RUNDIR}/server.stop || true
        # savage shutdown
        [ $i -gt 19 ] && pkill -f ${BASEDIR}/lib/ace.jar || true
        sleep 1
    done
    f_log "INFO - Shutdown complete. Nothing more to see here. Have a nice day!"
    f_log "INFO - Exit with status code ${?}"
    exit ${?};
}

f_idle_handler() {
    while true
    do
        tail -f /dev/null & wait ${!}
    done
}

trap 'kill ${!}; f_exit_handler' SIGHUP SIGINT SIGQUIT SIGTERM

if [ "$(id -u)" = '0' ]; then
    f_log "INFO - Entrypoint running with UID 0 (root)"
    if [[ "${@}" == 'unifi' ]]; then
        f_giduid
        f_mongo
        f_sysprop
        f_ssl
        f_bindpriv
        f_chown
        if [ "${RUNAS_UID0}" == 'true' ]; then
            f_log "INFO - RUNAS_UID0=true - running UniFi processes as UID 0 (root)"
            f_log "WARN - ======================================================================"
            f_log "WARN - *** Running as UID 0 (root) is an insecure configuration ***"
            f_log "WARN - ======================================================================"
            f_log "EXEC - /usr/bin/java ${JVM_OPTS} -jar ${BASEDIR}/lib/ace.jar start"
            exec /usr/bin/java ${JVM_OPTS} -jar ${BASEDIR}/lib/ace.jar start &
            f_idle_handler
        else
            if [ -x "/sbin/su-exec" ]; then
                f_log "INFO - Use su-exec to drop privileges and start Java/UniFi as GID=${PGID}, UID=${PUID}"
                f_log "EXEC - su-exec unifi:unifi /usr/bin/java ${JVM_OPTS} -jar ${BASEDIR}/lib/ace.jar start"
                exec su-exec unifi:unifi /usr/bin/java ${JVM_OPTS} -jar ${BASEDIR}/lib/ace.jar start &
                f_idle_handler
            elif [ -x "/usr/sbin/gosu" ]; then
                f_log "INFO - Use gosu to drop privileges and start Java/UniFi as GID=${PGID}, UID=${PUID}"
                f_log "EXEC - gosu unifi:unifi /usr/bin/java ${JVM_OPTS} -jar ${BASEDIR}/lib/ace.jar start"
                exec gosu unifi:unifi /usr/bin/java ${JVM_OPTS} -jar ${BASEDIR}/lib/ace.jar start &
                f_idle_handler
            else
                f_log "ERROR - su-exec/gosu NOT FOUND. Run state is invalid. Exiting."
                exit 1;
            fi
        fi
    else
        f_log "EXEC - ${@} as UID 0 (root)"
        exec "${@}"
    fi
else
    f_log "WARN - Container/entrypoint not started as UID 0 (root)"
    f_log "WARN - Unable to change permissions or set custom GID/UID if configured"
    f_log "WARN - Process will be spawned with GID=$(id -g), UID=$(id -u)"
    f_log "WARN - Depending on permissions requested command may not work"
    if [[ "${@}" == 'unifi' ]]; then
        f_mongo
        f_sysprop
        f_ssl
        f_log "EXEC - /usr/bin/java ${JVM_OPTS} -jar ${BASEDIR}/lib/ace.jar start"
        exec /usr/bin/java ${JVM_OPTS} -jar ${BASEDIR}/lib/ace.jar start &
        f_idle_handler
    else
        f_log "EXEC - ${@}"
        exec "${@}"
    fi
fi

# Script should never make it here, but just in case exit with a generic error code if it does
exit 1;
