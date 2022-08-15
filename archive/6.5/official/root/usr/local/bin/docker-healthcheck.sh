#!/usr/bin/env bash

# entrypoint-functions.sh script for UniFi Docker container
# License: Apache-2.0
# Github: https://github.com/goofball222/unifi
HEALTHCHECK_VERSION="1.0.1"
# Last updated date: 2019-12-06

BASEDIR="/usr/lib/unifi"
DATADIR=${BASEDIR}/data

[ ! -f ${DATADIR}/system.properties ] || api_port=$(grep "^[^#;]" ${DATADIR}/system.properties | sed -n 's/unifi.http.port=\([0-9]\+\)/\1/p')

api_port=${api_port:-8080}

http_code=$(curl -s --connect-timeout 1 -o /dev/null -w "%{http_code}" http://localhost:${api_port}/status)

#MAX_WAIT=25

#for i in `seq 1 ${MAX_WAIT}` ; do
#    if [ "${http_code}" != "200" ]; then
#        sleep 1 http_code=$(curl -s --connect-timeout 1 -o /dev/null -w "%{http_code}" http://localhost:${api_port}/status)
#    else
#        break
#    fi
#done

if [ "${http_code}" != "200" ]; then
        echo "Error: UniFi API http status code ${http_code}, expecting 200"
        exit 1
    else
        echo "UniFi API http status code ${http_code}: OK"
        exit 0
fi
