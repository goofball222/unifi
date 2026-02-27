#!/usr/bin/env bash

# entrypoint-functions.sh script for UniFi Docker container
# License: Apache-2.0
# Github: https://github.com/goofball222/unifi
ENTRYPOINT_FUNCTIONS_VERSION="1.2.1"
# Last updated date: 2026-02-20

f_bindpriv() {
    JAVABIN=$(readlink -f /usr/bin/java)
    if [ "${BIND_PRIV}" == 'true' ] && [ "${RUNAS_UID0}" == 'false' ]; then
        f_log "INFO - Support binding ports <1024 'setcap 'cap_net_bind_service=+ep' ${JAVABIN}'"
        if setcap 'cap_net_bind_service=+ep' ${JAVABIN}; then
            sleep 1
        else
            f_log "ERROR - BIND_PRIV=true and 'setcap' command failed on this Docker host"
            f_log "ERROR - If binding ports <1024 required on this Docker host use RUNAS_UID0=true instead"
            f_log "ERROR - Container run state is invalid, exiting..."
            exit 1;
        fi
    fi
}

f_chown() {
    if [ "${RUN_CHOWN}" == 'false' ] && [ "${RUNAS_UID0}" == 'false' ]; then
        if [ ! "$(stat -c %u ${BASEDIR})" = "${PUID}" ] || [ ! "$(stat -c %u ${CERTDIR})" = "${PUID}" ] \
        || [ ! "$(stat -c %u ${DATADIR})" = "${PUID}" ] || [ ! "$(stat -c %u ${LOGDIR})" = "${PUID}" ] \
        || [ ! "$(stat -c %u ${RUNDIR})" = "${PUID}" ]; then
            f_log "WARN - Configured PUID doesn't match owner of a required directory. Ignoring RUN_CHOWN=false"
            f_log "INFO - Ensuring permissions are correct before continuing - 'chown -R unifi:unifi ${BASEDIR}'"
            f_log "INFO - Running recursive 'chown' on Docker overlay2 storage is **really** slow. This may take a bit."
            chown -R unifi:unifi ${BASEDIR}
        else
            f_log "INFO - Explicitly setting owner on '${LOGDIR}/*.log' and '${DATADIR}/system.properties'"
            chown unifi:unifi ${DATADIR}/system.properties
            chown unifi:unifi ${LOGDIR}/*.log
            f_log "INFO - RUN_CHOWN=false - Not running 'chown -R unifi:unifi ${BASEDIR}', assume subdir/file permissions OK"
        fi
    elif [ "${RUNAS_UID0}" == 'true' ]; then
        f_log "INFO - RUNAS_UID0=true - Not running 'chown -R unifi:unifi ${BASEDIR}', no need to worry about permissions."
    else
        f_log "INFO - Ensuring permissions are correct before continuing - 'chown -R unifi:unifi ${BASEDIR}'"
        f_log "INFO - Running recursive 'chown' on Docker overlay2 storage is **really** slow. This may take a bit."
        chown -R unifi:unifi ${BASEDIR}
    fi
}

f_giduid() {
    UNIFI_GID=${UNIFI_GID:-}
    UNIFI_UID=${UNIFI_UID:-}
    if [ ! -z "${UNIFI_GID}" ]; then
        f_log "INFO - UNIFI_GID is set. Please use the updated PGID variable. Automatically converting to PGID."
        PGID=${UNIFI_GID}
    fi
    if [ ! -z "${UNIFI_UID}" ]; then
        f_log "INFO - UNIFI_UID is set. Please use the updated PUID variable. Automatically converting to PUID."
        PUID=${UNIFI_UID}
    fi
    if [ "$(id unifi -g)" != "${PGID}" ] || [ "$(id unifi -u)" != "${PUID}" ]; then
        f_log "INFO - Setting custom unifi GID/UID: GID=${PGID}, UID=${PUID}"
        groupmod -o -g ${PGID} unifi
        usermod -o -u ${PUID} unifi
    else
        f_log "INFO - GID/UID for unifi are unchanged: GID=${PGID}, UID=${PUID}"
    fi
}

f_log() {
    echo "$(date +"[%Y-%m-%d %T,%3N]") <docker-entrypoint> $*" | tee -a ${BASEDIR}/logs/server.log
}

f_mongo() {
    DB_MONGO_LOCAL=${DB_MONGO_LOCAL:-}
    DB_MONGO_URI=${DB_MONGO_URI:-}
    STATDB_MONGO_URI=${STATDB_MONGO_URI:-}
    UNIFI_DB_NAME=${UNIFI_DB_NAME:-}
    SUP_MONGOD_VER=${SUP_MONGOD_VER:-}
    MONGOD_TARGET_EOL_DATE=${MONGOD_TARGET_EOL_DATE:-}
    ARCH=$(/bin/uname -m)
    if [ -x "/usr/bin/mongod" ]; then
    # Container has a built in mongod executable
        if [ "$ARCH" != "x86_64" ]; then
        # Non x86_64 architecture, no AVX check
            if [ -z "${DB_MONGO_LOCAL}" ] || [ -z "${DB_MONGO_URI}" ] || [ -z "${STATDB_MONGO_URI}" ] \
            || [ -z "${UNIFI_DB_NAME}" ]; then
            # Check if any external MongoDB variables are empty
                MONGOD_VER="$(/usr/bin/mongod --version | awk -F'[ ]' 'NR==1{print $3}')"
                if [ "$(printf '%s\n' "$SUP_MONGOD_VER" "$MONGOD_VER" | sort -V | head -n1)" = "$SUP_MONGOD_VER" ]; then
                # Check mongod reported version
                    f_log "INFO - mongod detected version ${MONGOD_VER} is >= ${SUP_MONGOD_VER}, continuing."
                else
                    f_log "ERROR - ======================================================================"
                    f_log "ERROR - THIS IMAGE WILL STOP SUPPLYING EMBEDDED MONGO VERSIONS BELOW ${SUP_MONGOD_VER}"
                    f_log "ERROR -                      ON OR AFTER ${MONGOD_TARGET_EOL_DATE}"
                    f_log "ERROR - ======================================================================"
                    f_log "ERROR - "
                    f_log "ERROR - ======================================================================"
                    f_log "ERROR - mongod detected version ${MONGOD_VER} is past end-of-life / end-of-support."
                    f_log "ERROR - "
                    f_log "ERROR - The UniFi latest supported version at this time is ${SUP_MONGOD_VER},"
                    f_log "ERROR - higher versions may also work. Please review the UniFi release notes and"
                    f_log "ERROR - https://www.mongodb.com/legal/support-policy/lifecycles"
                    f_log "ERROR - for more information. You should immediately back up your data via the"
                    f_log "ERROR - UniFi console & restore on a version of the image with newer mongo,"
                    f_log "ERROR - OR back up and perform the MongoDB upgrade steps to reach >= ${SUP_MONGOD_VER}."
                    f_log "ERROR - ======================================================================"
                    f_log "ERROR - NOW PAUSING FOR 180 SECONDS BEFORE CONTINUING STARTUP"
                    sleep 180
                fi
                # Point users towards running with an external MongoDB
                f_log "WARN - ======================================================================"
                f_log "WARN - One or more of: 'DB_MONGO_LOCAL', 'DB_MONGO_URI', 'STATDB_MONGO_URI', or 'UNIFI_DB_NAME' is unset."
                f_log "WARN - In the future you should consider running UniFi on Docker with an external MongoDB instance defined."
                f_log "WARN - *** Please check the README.md and examples at https://github.com/goofball222/unifi ***"
                f_log "WARN - ======================================================================"
            fi
        elif [ "$ARCH" == "x86_64" ] && `/bin/grep -q 'avx' /proc/cpuinfo` && `/bin/grep -q 'avx2' /proc/cpuinfo`; then
        # x86_64 architecture *with* AVX required by Mongo versions >= 5.0
            if [ -z "${DB_MONGO_LOCAL}" ] || [ -z "${DB_MONGO_URI}" ] || [ -z "${STATDB_MONGO_URI}" ] \
            || [ -z "${UNIFI_DB_NAME}" ]; then
            # Check if any external MongoDB variables are empty
                MONGOD_VER="$(/usr/bin/mongod --version | awk -F'[ ]' 'NR==1{print $3}')"
                if [ "$(printf '%s\n' "$SUP_MONGOD_VER" "$MONGOD_VER" | sort -V | head -n1)" = "$SUP_MONGOD_VER" ]; then
                # Check mongod reported version
                    f_log "INFO - mongod detected version ${MONGOD_VER} is >= ${SUP_MONGOD_VER}, continuing."
                else
                    f_log "ERROR - ======================================================================"
                    f_log "ERROR - THIS IMAGE WILL STOP SUPPLYING EMBEDDED MONGO VERSIONS BELOW ${SUP_MONGOD_VER}"
                    f_log "ERROR -                      ON OR AFTER ${MONGOD_TARGET_EOL_DATE}"
                    f_log "ERROR - ======================================================================"
                    f_log "ERROR - "
                    f_log "ERROR - ======================================================================"
                    f_log "ERROR - mongod detected version ${MONGOD_VER} is past end-of-life / end-of-support."
                    f_log "ERROR - "
                    f_log "ERROR - The UniFi latest supported version at this time is ${SUP_MONGOD_VER},"
                    f_log "ERROR - higher versions may also work. Please review the UniFi release notes and"
                    f_log "ERROR - https://www.mongodb.com/legal/support-policy/lifecycles"
                    f_log "ERROR - for more information. You should immediately back up your data via the"
                    f_log "ERROR - UniFi console & restore on a version of the image with newer mongo,"
                    f_log "ERROR - OR back up and perform the MongoDB upgrade steps to reach >= ${SUP_MONGOD_VER}."
                    f_log "ERROR - ======================================================================"
                    f_log "ERROR - NOW PAUSING FOR 180 SECONDS BEFORE CONTINUING STARTUP"
                    sleep 180
                fi
                # Point users towards running with an external MongoDB
                f_log "WARN - ======================================================================"
                f_log "WARN - One or more of: 'DB_MONGO_LOCAL', 'DB_MONGO_URI', 'STATDB_MONGO_URI', or 'UNIFI_DB_NAME' is unset."
                f_log "WARN - In the future you should consider running UniFi on Docker with an external MongoDB instance defined."
                f_log "WARN - *** Please check the README.md and examples at https://github.com/goofball222/unifi ***"
                f_log "WARN - ======================================================================"
            fi
        else
        # x86_64 architecture *missing* AVX required by Mongo versions >= 5.0
            if [ -z "${DB_MONGO_LOCAL}" ] || [ -z "${DB_MONGO_URI}" ] || [ -z "${STATDB_MONGO_URI}" ] \
            || [ -z "${UNIFI_DB_NAME}" ]; then
            # Check if any required external MongoDB variables are empty, throw an error, exit.
                f_log "ERROR - ======================================================================"
                f_log "ERROR - *** THE x86_64 CPU in THIS SYSTEM DOES NOT SUPPORT AVX EXTENSIONS ***"
                f_log "ERROR - "
                f_log "ERROR - Versions >= 5.0 of MongoDB require AVX extensions on x86_64 CPUs."
                f_log "ERROR - For releases of this container >= 10.1 or released after 2026-02-11 you must run this container"
                f_log "ERROR - with an external MongoDB instance that meets the restricted capabilities of your system."
                f_log "ERROR - "
                f_log "ERROR - One or more of: 'DB_MONGO_LOCAL', 'DB_MONGO_URI', 'STATDB_MONGO_URI', or 'UNIFI_DB_NAME' is unset."
                f_log "ERROR - This container cannot run UniFi without all Mongo external env variables defined correctly."
                f_log "ERROR - They must be pointed to a valid external MongoDB container or host instance."
                f_log "ERROR - *** Please check the README.md and examples at https://github.com/goofball222/unifi ***"
                f_log "ERROR - ======================================================================"
                f_log "ERROR - Container run environment is invalid, exiting in 300 seconds..."
                sleep 300
                exit 1;
            fi
        fi
    else
    # Container does not have a built-in mongod executable
        if [ -z "${DB_MONGO_LOCAL}" ] || [ -z "${DB_MONGO_URI}" ] || [ -z "${STATDB_MONGO_URI}" ] \
        || [ -z "${UNIFI_DB_NAME}" ]; then
        # Check if any required external MongoDB variables are empty, throw an error, exit.
            f_log "ERROR - ======================================================================"
            f_log "ERROR - One or more of: 'DB_MONGO_LOCAL', 'DB_MONGO_URI', 'STATDB_MONGO_URI', or 'UNIFI_DB_NAME' is unset."
            f_log "ERROR - This container cannot run UniFi without all Mongo external env variables defined correctly."
            f_log "ERROR - They must be pointed to a valid external MongoDB container or host instance."
            f_log "ERROR - *** Please check the README.md and examples at https://github.com/goofball222/unifi ***"
            f_log "ERROR - ======================================================================"
            f_log "ERROR - Container run environment is invalid, exiting in 300 seconds..."
            sleep 300
            exit 1;
        fi
    fi
}

f_ssl() {
    if [ -e ${CERTDIR}/privkey.pem ] && [ -e ${CERTDIR}/cert.pem ]; then
        if `/usr/bin/sha256sum -c ${CERTDIR}/unificert.sha256 &> /dev/null`; then
            f_log "INFO - SSL: certificate files unchanged, continuing with UniFi startup"
            f_log "INFO - SSL: To force rerun import process: delete '${CERTDIR}/unificert.sha256' and restart the container"
        else
            if [ ! -e ${DATADIR}/keystore ]; then
                f_log "WARN - SSL: keystore does not exist, generating it with Java keytool"
                keytool -genkey -keyalg RSA -alias unifi -keystore ${DATADIR}/keystore \
                -storepass aircontrolenterprise -keypass aircontrolenterprise -validity 1825 \
                -keysize 4096 -dname "cn=UniFi"
            else
                f_log "INFO - SSL: backup existing '${DATADIR}/keystore' to '${DATADIR}/keystore-$(date +%s)'"
                cp ${DATADIR}/keystore ${DATADIR}/keystore-$(date +%s)
            fi
            f_log "INFO - SSL: custom certificate keystore update"
            f_log "INFO - SSL: openssl combine custom private key and certificate into temporary PKCS12 file"
            openssl pkcs12 -export \
                -inkey ${CERTDIR}/privkey.pem \
                -in ${CERTDIR}/cert.pem \
                -out ${CERTDIR}/certtemp.p12 \
                -name unifi -password pass:temppass
            f_log "INFO - SSL: Java keytool import PKCS12 '${CERTDIR}/certtemp.p12' file into '${DATADIR}/keystore'"
            keytool -importkeystore -deststorepass aircontrolenterprise \
             -destkeypass aircontrolenterprise -destkeystore ${DATADIR}/keystore \
             -srckeystore ${CERTDIR}/certtemp.p12 -srcstoretype PKCS12 \
             -srcstorepass temppass -alias unifi -noprompt
            f_log "INFO - SSL: Removing temporary PKCS12 file"
            rm ${CERTDIR}/certtemp.p12
            f_log "INFO - SSL: Store SHA256 hash of private key and certificate file"
            /usr/bin/sha256sum ${CERTDIR}/privkey.pem > ${CERTDIR}/unificert.sha256
            /usr/bin/sha256sum ${CERTDIR}/cert.pem >> ${CERTDIR}/unificert.sha256
            f_log "INFO - SSL: completed update of custom certificate in '${DATADIR}/keystore'"
            f_log "INFO - SSL: Check above ***here*** for errors if your custom certificate import isn't working"
            f_log "INFO - SSL: To force rerun import process: delete '${CERTDIR}/unificert.sha256' and restart the container"
        fi
    else
        [ -f ${CERTDIR}/privkey.pem ] || f_log "WARN - Custom SSL: missing '${CERTDIR}/privkey.pem'"
        [ -f ${CERTDIR}/cert.pem ] || f_log "WARN - Custom SSL: missing '${CERTDIR}/cert.pem'"
        if [ -e ${CERTDIR}/fullchain.pem ]; then
            f_log "WARN - UniFi v7.3+ Custom SSL: *********** '${CERTDIR}/fullchain.pem' IS DEPRECATED ***********"
            f_log "WARN - UniFi v7.3+ Custom SSL: Use a single / non-chain cert file named '${CERTDIR}/cert.pem' moving forward"
            f_log "WARN - UniFi v7.3+ Custom SSL: Failure to update current setup may result in constant <ble-load-keystore> errors"
        fi
        f_log "WARN - Custom SSL: certificate import was NOT performed"
    fi
}

f_sysprop() {
    # UniFi system.properties container mode setup (echo logs to STDOUT, support ENV read)
    f_log "INFO - Checking system.properties setup for container"
    if [ ! -e ${DATADIR}/system.properties ]; then
        f_log "INFO - '${DATADIR}/system.properties' doesn't exist, copying from '${BASEDIR}/system.properties.default'"
        cp ${BASEDIR}/system.properties.default ${DATADIR}/system.properties
    else
        f_log "INFO - Existing '${DATADIR}/system.properties' found, ensuring container mode options are enabled"
        if ! grep -q "unifi.logStdout" "${DATADIR}/system.properties"; then
            echo "unifi.logStdout=${LOGSTDOUT}" >> ${DATADIR}/system.properties
        else
            sed -i "/unifi.logStdout/c\unifi.logStdout=${LOGSTDOUT}" ${DATADIR}/system.properties
        fi

        if ! grep -q "unifi.config.readEnv" "${DATADIR}/system.properties"; then
            echo "unifi.config.readEnv=${READENV}" >> ${DATADIR}/system.properties
        else
            sed -i "/unifi.config.readEnv/c\unifi.config.readEnv=${READENV}" ${DATADIR}/system.properties
        fi
    fi
}
