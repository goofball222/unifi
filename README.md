
# UniFi Docker Container

[![Latest Build Status](https://github.com/goofball222/unifi/actions/workflows/build-latest.yml/badge.svg)](https://github.com/goofball222/unifi/actions/workflows/build-latest.yml) [![Docker Pulls](https://img.shields.io/docker/pulls/goofball222/unifi.svg)](https://hub.docker.com/r/goofball222/unifi/) [![Docker Stars](https://img.shields.io/docker/stars/goofball222/unifi.svg)](https://hub.docker.com/r/goofball222/unifi/) [![MB License](https://images.microbadger.com/badges/license/goofball222/unifi.svg)](https://microbadger.com/images/goofball222/unifi)

## Docker tags:
| Tag | UniFi Version | Description | Release Date |
| --- | :---: | --- | :---: |
| [6.2, 6.2-alpine, 6.2-ubuntu, latest, latest-alpine, latest-ubuntu](https://github.com/goofball222/unifi/blob/main/6.2/official/Dockerfile) | [6.2.26](https://community.ui.com/releases/UniFi-Network-Application-6-2-26/0dfcbc77-8a4f-4e20-bb93-07bbb0237e3a) | UniFi Network Application official release | 2021-06-21 |
| [6.4, 6.4-alpine, 6.4-ubuntu, 6.4-beta, 6.4-alpine-beta, 6.4-ubuntu-beta](https://github.com/goofball222/unifi/blob/main/6.4/beta/Dockerfile) | [6.4.47](https://community.ui.com/releases/UniFi-Network-Application-6-4-47/e1634fdf-fd71-4750-835d-b65af04c44c3) | UniFi Network Application beta release  | 2021-07-27 |
| [6.3, 6.3-alpine, 6.3-ubuntu, 6.3-beta, 6.3-alpine-beta, 6.3-ubuntu-beta](https://github.com/goofball222/unifi/blob/main/6.3/beta/Dockerfile) | [6.3.51](https://community.ui.com/releases/UniFi-Network-Application-6-3-51/af39cc49-d743-462f-978a-5707d217bb4f) | UniFi Network Application beta release  | 2021-06-24 |
| [6.1, 6.1-alpine, 6.1-ubuntu](https://github.com/goofball222/unifi/blob/main/6.1/official/Dockerfile) | [6.1.71](https://community.ui.com/releases/UniFi-Network-Controller-6-1-71/0cffd3ed-7429-4529-9a20-9fead78ebf66) | UniFi Network Application official release  | 2021-03-25 |
| [6.0, 6.0-alpine, 6.0-ubuntu](https://github.com/goofball222/unifi/blob/main/6.0/official/Dockerfile) | [6.0.45](https://community.ui.com/releases/UniFi-Network-Controller-6-0-45/8d3b98e1-b9d4-4ab3-b8da-721dbe9ab842) | UniFi Network Application official release | 2021-01-26 |
| [5.14, 5.14-alpine, 5.14-ubuntu](https://github.com/goofball222/unifi/blob/main/5.14/official/Dockerfile) | [5.14.23](https://community.ui.com/releases/UniFi-Network-Controller-5-14-23/daf90732-30ad-48ee-81e7-1dcb374eba2a) | UniFi Network Application official release | 2020-08-25 |
| [6.2.26](https://github.com/goofball222/unifi/releases/tag/6.2.26) | [6.2.26](https://community.ui.com/releases/UniFi-Network-Application-6-2-25/d9cb0897-3ef4-4dda-a5d6-c07530ff8a86) | Static official release tag/image | 2021-06-24 |
| [6.1.71](https://github.com/goofball222/unifi/releases/tag/6.1.71) | [6.1.71](https://community.ui.com/releases/UniFi-Network-Controller-6-1-71/0cffd3ed-7429-4529-9a20-9fead78ebf66) | Static official release tag/image | 2021-03-25 |
| [6.0.45](https://github.com/goofball222/unifi/releases/tag/6.0.45) | [6.0.45](https://community.ui.com/releases/UniFi-Network-Controller-6-0-45/8d3b98e1-b9d4-4ab3-b8da-721dbe9ab842) | Static official release tag/image | 2021-01-26 |
| [5.14.23](https://github.com/goofball222/unifi/releases/tag/5.14.23) | [5.14.23](https://community.ui.com/releases/UniFi-Network-Controller-5-14-23/daf90732-30ad-48ee-81e7-1dcb374eba2a) | Static official release tag/image | 2020-08-25 |
| [5.13.32](https://github.com/goofball222/unifi/releases/tag/5.13.32) | [5.13.32](https://community.ui.com/releases/UniFi-Network-Controller-5-13-32/85eee834-c987-4875-8de2-51c6842d7bd3) | Static official release tag/image | 2020-07-02 |
| [5.12.72](https://github.com/goofball222/unifi/releases/tag/5.12.72) | [5.12.72](https://community.ui.com/releases/UniFi-Network-Controller-5-12-72/9ac72983-5130-4f58-b3ba-909f4d4bb5f9) | Static official release tag/image | 2020-05-18 |
| [5.11.50](https://github.com/goofball222/unifi/releases/tag/5.11.50) | [5.11.50](https://community.ui.com/releases/UniFi-Network-Controller-5-11-50/1728a1f1-f0a8-45dd-a2e2-95abcfc50dab) | Static official release tag/image | 2019-10-08 |
| [5.6.42](https://github.com/goofball222/unifi/releases/tag/5.6.42) | [5.6.42](https://community.ubnt.com/t5/UniFi-Updates-Blog/UniFi-Network-Controller-5-6-42-Stable-has-been-released/ba-p/2771271) | Static official release tag/image | 2019-05-03 |

---

* [Recent changes, see: GitHub CHANGELOG.md](https://github.com/goofball222/unifi/blob/main/CHANGELOG.md)
* [Report any bugs, issues or feature requests on GitHub](https://github.com/goofball222/unifi/issues)

---

**NOTE:**
**Alpine tags DO NOT contain any internal MongoDB binaries. You must connect them to an external Mongo DB container or other host instance.**

**2021-06-16:**
* **GitHub actions build allows multi-architecture platforms:**
* Latest/default tag Debian Buster image: linux/amd64
* Alpine image: linux/amd64, linux/arm64, linux/arm/v7
* New Ubuntu image: linux/amd64, linux/arm64
* Multi-architechture images rebuilt back to 5.14 (non-static/tagged builds).
* Targeting switch from Debian as latest/default to Ubuntu in the near future if no [issues](https://github.com/goofball222/unifi/issues) reported with it. Please test!

**2021-06-15:**
* Switch "latest" and "latest-alpine" tags to track 6.2 official.
* Make sure you're making regular backups before upgrading, rolling back to an older version without a .unf file or a full DB backup is not possible.

**2020-10-25:**
* Directory and tag structure was reworked to match UI community beta/official designations (no more unstable/testing/sc/stable)


---

For security/attack surface reduction the container is configured to run the UniFi processes as an internal user & group `unifi` having a pre-set UID & GID of 999.
The container will attempt to adjust permissions on mapped volumes and data to match before dropping privileges to start the UniFi Java and Mongo processes.
If the container is being run with a different Docker --user setting permissions may need to be fixed manually.

IE: `chown -R 999:999 ./{cert,data,logs}`

A custom UID and GID can be configured for the container internal unifi user and group. For more information see the "Environment variables" section in this document.

---

**ALWAYS MAKE A VERIFIED BACKUP OF DATA BEFORE INSTALLING UPDATES.**
**Export a `.unf` from the web interface and/or stop the current container and create a backup or copy of the data volume.**
**Database rollback from newer to older versions of UniFi and/or Mongo isn't always possible.**

---

## Usage

This container exposes three volumes:
* `/usr/lib/unifi/cert` - SSL custom certificate storage
* `/usr/lib/unifi/data` - UniFi configuration data and DBs
* `/usr/lib/unifi/logs` - UniFi and MongoDB logs for troubleshooting


This container exposes the following ports (see: https://help.ubnt.com/hc/en-us/articles/218506997-UniFi-Ports-Used):
* `3478/udp` (port used for STUN connection)
* `6789/tcp` (port used for throughput measurement from Android/iOS app)
* `8080/tcp` (port for UAP/USW/USG to inform controller)
* `8443/tcp` (port for controller GUI / API)
* `8880/tcp` (port for HTTP portal redirect)
* `8843/tcp` (port for HTTPS portal redirect)
* `10001/udp` (port used for UBNT discovery broadcasts - Local LAN/L2/same subnet **only**)

---

**The most basic way to run this container:**

```bash
$ docker run --name unifi -d \
    -p 3478:3478/udp -p 8080:8080 -p 8443:8443 \
    -p 8880:8880 -p 8843:8843 \
    goofball222/unifi
```

---

**Recommended run method: [Docker Compose](https://docs.docker.com/compose/) - UniFi app and internal Mongo DB:**

```bash

version: '3'

services:
  unifi:
    image: goofball222/unifi
    container_name: unifi
    restart: unless-stopped
    network_mode: bridge
    ports:
      - 3478:3478/udp
      - 8080:8080
      - 8443:8443
      - 8880:8880
      - 8843:8843
    volumes:
      - /etc/localtime:/etc/localtime:ro
      - ./cert:/usr/lib/unifi/cert
      - ./data:/usr/lib/unifi/data
      - ./logs:/usr/lib/unifi/logs
    environment:
      - TZ=UTC

```

---

**Recommended run method: [Docker Compose](https://docs.docker.com/compose/) - UniFi app and Mongo DB as separate services:**

```bash

version: '3'

services:
  mongo:
    image: mongo
    container_name: unifidb
    restart: unless-stopped
#   By default docker-compose will create a new bridge network for the services in the compose file.
#   Enable this to have the services/containers use the existing docker0/default bridge network.
#    network_mode: bridge
    volumes:
      - ./data/db:/data/db

  unifi:
    image: goofball222/unifi
    container_name: unifi
    restart: unless-stopped
#   By default docker-compose will create a new bridge network for the services in the compose file.
#   Enable this to have the services/containers use the existing docker0/default bridge network.
#    network_mode: bridge
    links:
      - mongo
    ports:
      - 3478:3478/udp
      - 8080:8080
      - 8443:8443
      - 8880:8880
      - 8843:8843
#     Optional: Uncomment to enable speed tests from the UniFi iOS & Android apps
#      - 6789:6789
#     Optional: Uncomment for layer 2 broadcast discovery if container running on a host in the local LAN
#      - 10001:10001/udp
    volumes:
      - /etc/localtime:/etc/localtime:ro
      - ./cert:/usr/lib/unifi/cert
      - ./data:/usr/lib/unifi/data
      - ./logs:/usr/lib/unifi/logs
    environment:
      - DB_MONGO_LOCAL=false
      - DB_MONGO_URI=mongodb://mongo:27017/unifi
      - STATDB_MONGO_URI=mongodb://mongo:27017/unifi_stat
      - TZ=UTC
      - UNIFI_DB_NAME=unifi

```

---

**Alternative network setup suggested by [rogierlommers](https://hub.docker.com/r/rogierlommers/) -**

**Please make sure to read the "NETWORK: HOST" section of the [Docker "run" reference](https://docs.docker.com/engine/reference/run/#network-settings) and understand the implications of this before using.**

Copy the following to both services in the docker-compose.yml file under the commented out `network_mode: bridge` line in the example above, and then uncomment the `network_mode: host` line:

```bash

#   Use host network mode. Does not allow for port remapping. You may need to manually adjust
#       host firewall settings to allow traffic. Running a container in this mode is considered insecure.
#    network_mode: host

```

---

[Example basic `docker-compose.yml` in file form](https://raw.githubusercontent.com/goofball222/unifi/main/examples/docker-compose.yml).

[Example advanced `docker-compose.yml` in file form](https://raw.githubusercontent.com/goofball222/unifi/main/examples/docker-compose.externaldb.yml) with external Mongo DB service and UniFi service using environment variables.

---

**Environment variables:**

| Variable | Default | Description |
| :--- | :---: | --- |
| `BIND_PRIV` | ***false*** | Set to *true* to allow UniFi process to bind to container internal ports &lt; 1024 |
| `DEBUG` | ***false*** | Set to *true* for extra container and UniFi verbosity for debugging |
| `JVM_EXTRA_OPTS` | ***unset*** | Any additional custom run flags for the container Java process |
| `JVM_INIT_HEAP_SIZE` | ***unset*** | Sets the start and min memory size for the container Java process (-Xms) |
| `JVM_MAX_HEAP_SIZE` | ***1024M*** | Sets the max memory size for the container Java process (-Xmx) |
| `PGID` | ***999*** | Specifies the GID for the container internal unifi group (used for file ownership) |
| `PUID` | ***999*** | Specifies the UID for the container internal unifi user (used for process and file ownership) |
| `RUN_CHOWN` | ***true*** | Set to *false* to disable the container automatic `chown` at startup. Speeds up startup process on overlay2 Docker hosts. **NB/IMPORTANT:** It's critical that you insure directory/data permissions on all mapped volumes are correct before disabling this or UniFi and/or Mongo will not start. |
| `RUNAS_UID0` | ***false*** | Set to *true* to force the container to run the Java/Mongo processes as UID=0 (root) - workaround for `setcap` AUFS missing xargs failure - **NB/IMPORTANT:** running with this set to "true" is insecure |

Recommended UniFi system.properties converted environment variables to externalize Mongo DB via docker-compose:

| Variable | Recommended Setting | Description |
| :--- | :---: | --- |
| `DB_MONGO_LOCAL` | ***false*** | Setting this to *false* tells UniFi that we're using an external Mongo DB |
| `DB_MONGO_URI` | ***mongodb://mongo:27017/unifi***| This sets the URI that UniFi should connect to for the main configuration database |
| `STATDB_MONGO_URI` | ***mongodb://mongo:27017/unifi_stat*** | This sets the URI that UniFi should connect to for the statistics database |
| `UNIFI_DB_NAME` | ***unifi*** | Sets a database name that can be connected and managed on the external Mongo DB server, must match with the URI variables (IE: unifi, unifi_stat = unifi). |

**NB/IMPORTANT:** Although I've been running my own deployments with an external DB for a year or more without issue with these settings externalizing the DB, just like running the app itself in a Docker container, is considered experimental and totally unsupported by UBNT. Full documentation for an external DB setup is outside the scope of this README and is left as an exercise for the interested reader. Additional information available on the [UBNT forums in this post](https://community.ubnt.com/t5/UniFi-Wireless/External-MongoDB-Server/m-p/1711073/highlight/true#M188357) and in the PDF post linked below.

Additional UniFi [system.properties](https://help.ubnt.com/hc/en-us/articles/205202580-UniFi-system-properties-File-Explanation) config file settings can be passed to the container as -e/--env/environment flags at runtime [(more detail and a PDF with UBNT examples here)](https://community.ubnt.com/t5/UniFi-Wireless-Beta/Unifi-Controller-High-Availability/m-p/1801933/highlight/true#M43494). Envrionment variables must be in ALL CAPS and replace "." with "_". -- **IE:**

| system.properties | Environment Variable |
| :--- | :--- |
| unifi.db.extraargs | UNIFI_DB_EXTRAARGS |
| unifi.https.hsts | UNIFI_HTTPS_HSTS |

---

**SSL custom certificate auto-configuration support ([LetsEncrypt](https://letsencrypt.org/), etc.):**

1. Map the Docker host cert storage location or volume to the `/usr/lib/unifi/cert` volume exposed by the container
2. Must contain a PEM format SSL private key corresponding to the SSL certificate to be installed.
Private key file **MUST** be named `privkey.pem`.
3. Must contain a PEM format SSL certificate file with the full certification chain. LetsEncrypt handles this automatically, other providers may need manual work (https://www.digicert.com/ssl-support/pem-ssl-creation.htm).
Certificate file **MUST** be named `fullchain.pem`.
4. Start the container. SSL import and Java keystore update process is automated during startup. Status, errors, etc. can be found in the container log, IE: `docker logs "containername"`
5. Existing keystore file will be backed up to  `/usr/lib/unifi/data/keystore-"epochseconds"`
6. Java keystore is only updated when changes to the certificate files are detected. To force a re-import of existing files delete the `unificert.sha256` file in `./cert` and restart the container.

If you don't want to use a custom SSL certificate then the `/usr/lib/unifi/cert` volume can be left unmapped. Alternatively if the `privkey.pem` and/or `fullchain.pem` file are not present SSL customization will be skipped.

To revert from a custom cert to a UniFi self-signed certificate stop the container, rename or remove `./data/keystore`, and restart the container. The UniFi application will automatically generate a new keystore file with a new self-signed cert.

---

## beta and bleeding-edge official tag warning

**NOT RECOMMENDED FOR USE IN A PRODUCTION ENVIRONMENT - FOR TESTING/LABS ONLY**

_There have been past UniFi beta and ***official*** releases with AP bricking firmware, network breaking bugs, etc._

_Proceed with caution! Use at your own risk._

If you're going to use these images please make sure you create a UBNT community account:
https://community.ui.com/

Instructions for how to sign up for beta/early access at:
https://help.ui.com/hc/en-us/articles/204908664-How-To-Sign-Up-for-Early-Access

Please make sure to participate in discussion and create bug reports for any issues you encounter with beta/early access releases.

**USE BETA/BLEEDING-EDGE RELEASES AT YOUR OWN RISK - REPEAT: NOT RECOMMENDED FOR USE IN A PRODUCTION ENVIRONMENT WITHOUT EXTENSIVE TESTING**

[//]: # (Licensed under the Apache 2.0 license)
[//]: # (Copyright 2021 The Goofball - goofball222@gmail.com)
