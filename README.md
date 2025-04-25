
# UniFi Docker Container

[![Latest Build Status](https://github.com/goofball222/unifi/actions/workflows/build-latest.yml/badge.svg)](https://github.com/goofball222/unifi/actions/workflows/build-latest.yml) [![Docker Pulls](https://img.shields.io/docker/pulls/goofball222/unifi.svg)](https://hub.docker.com/r/goofball222/unifi/) [![Docker Stars](https://img.shields.io/docker/stars/goofball222/unifi.svg)](https://hub.docker.com/r/goofball222/unifi/) [![License](https://img.shields.io/github/license/goofball222/unifi.svg)](https://github.com/goofball222/unifi)

## Docker tags:
| Tag | UniFi Version | Description | Release Date |
| --- | :---: | --- | :---: |
| [9.1, 9.1-alpine, 9.1-debian, 9.1-ubuntu, latest, latest-alpine, latest-debian, latest-ubuntu](https://github.com/goofball222/unifi/blob/main/9.1/official/Dockerfile) | [9.1.120](https://community.ui.com/releases/UniFi-Network-Application-9-1-120/a5e88ae2-3c44-420a-bebb-5120bf2288b2) | UniFi Network Application official release | 2025-04-25 |
| [9.1-beta, 9.1-alpine-beta, 9.1-debian-beta, 9.1-ubuntu-beta, latest-beta, latest-alpine-beta, latest-debian-beta, latest-ubuntu-beta](https://github.com/goofball222/unifi/blob/main/9.1/beta/Dockerfile) | [9.1.120](https://community.ui.com/releases/UniFi-Network-Application-9-1-120/a5e88ae2-3c44-420a-bebb-5120bf2288b2) | UniFi Network Application beta/release candidate | 2025-04-25 |
| [9.0, 9.0-alpine, 9.0-debian, 9.0-ubuntu](https://github.com/goofball222/unifi/blob/main/9.0/official/Dockerfile) | [9.0.114](https://community.ui.com/releases/UniFi-Network-Application-9-0-114/35b6e9ac-f63d-46c9-bbbe-74a4a61ac95f) | UniFi Network Application official release | 2025-02-04 |
| [9.1.120](https://github.com/goofball222/unifi/releases/tag/9.1.120) | [9.1.120](https://community.ui.com/releases/UniFi-Network-Application-9-1-120/a5e88ae2-3c44-420a-bebb-5120bf2288b2) | Static official release tag/image | 2025-04-25 |
| [9.0.114](https://github.com/goofball222/unifi/releases/tag/9.0.114) | [9.0.114](https://community.ui.com/releases/UniFi-Network-Application-9-0-114/35b6e9ac-f63d-46c9-bbbe-74a4a61ac95f) | Static official release tag/image | 2025-02-04 |

<details><summary>Older Static Tags</summary>

| Tag | UniFi Version | Description | Release Date |
| --- | :---: | --- | :---: |
| [8.6.9](https://github.com/goofball222/unifi/releases/tag/8.6.9) | [8.6.9](https://community.ui.com/releases/UniFi-Network-Application-8-6-9/e4bd3f71-a2c4-4c98-b12a-a8b0b1c2178e) | Static official release tag/image | 2024-11-07 |
| [8.5.6](https://github.com/goofball222/unifi/releases/tag/8.5.6) | [8.5.6](https://community.ui.com/releases/UniFi-Network-Application-8-5-6/bfa15dd8-8b58-4d40-9d83-73ebe8c9a955) | Static official release tag/image | 2024-10-09 |
| [8.4.62](https://github.com/goofball222/unifi/releases/tag/8.4.62) | [8.4.62](https://community.ui.com/releases/UniFi-Network-Application-8-4-62/40240312-bb43-4648-adab-5b05f3d4354e) | Static official release tag/image | 2024-09-11 |
| [8.3.32](https://github.com/goofball222/unifi/releases/tag/8.3.32) | [8.3.32](https://community.ui.com/releases/UniFi-Network-Application-8-3-32/54f3b506-afcf-4a7c-aba6-01a884dd9003) | Static official release tag/image | 2024-07-15 |
| [8.2.93](https://github.com/goofball222/unifi/releases/tag/8.2.93) | [8.2.93](https://community.ui.com/releases/UniFi-Network-Application-8-2-93/fce86dc6-897a-4944-9c53-1eec7e37e738) | Static official release tag/image | 2024-06-03 |
| [8.1.127](https://github.com/goofball222/unifi/releases/tag/8.1.127) | [8.1.127](https://community.ui.com/releases/UniFi-Network-Application-8-1-127/571d2218-216c-4769-a292-796cff379561) | Static official release tag/image | 2024-05-03 |
| [8.0.28](https://github.com/goofball222/unifi/releases/tag/8.0.28) | [8.0.28](https://community.ui.com/releases/UniFi-Network-Application-8-0-28/f7492865-778d-4539-aaf8-3fb09c4279b0) | Static official release tag/image | 2024-01-25 |
| [7.5.187](https://github.com/goofball222/unifi/releases/tag/7.5.187) | [7.5.187](https://community.ui.com/releases/UniFi-Network-Application-7-5-187/408b64c5-a485-4a37-843c-31e87140be64) | Static official release tag/image | 2023-10-17 |
| [7.4.162](https://github.com/goofball222/unifi/releases/tag/7.4.162) | [7.4.162](https://community.ui.com/releases/UniFi-Network-Application-7-4-162/50b4b930-631e-4ada-87c4-0b4ea5fb26a7) | Static official release tag/image | 2023-07-03 |
| [7.3.83](https://github.com/goofball222/unifi/releases/tag/7.3.83) | [7.3.83](https://community.ui.com/releases/UniFi-Network-Application-7-3-83/88f5ff3f-4c13-45e2-b57e-ad04b4140528) | Static official release tag/image | 2023-01-30 |
| [7.2.97](https://github.com/goofball222/unifi/releases/tag/7.2.97) | [7.2.97](https://community.ui.com/releases/UniFi-Network-Application-7-2-97/d2f71152-3001-42cd-834c-9245d86f4e72) | Static official release tag/image | 2023-02-06 |
| [7.1.68](https://github.com/goofball222/unifi/releases/tag/7.1.68) | [7.1.68](https://community.ui.com/releases/UniFi-Network-Application-7-1-68/30df65ee-9adf-44da-ba0c-f30766c2d874) | Static official release tag/image | 2022-08-02 |
| [7.0.25](https://github.com/goofball222/unifi/releases/tag/7.0.25) | [7.0.25](https://community.ui.com/releases/UniFi-Network-Application-7-0-25/3344c362-7da5-4ecd-a403-3b47520e3c01) | Static official release tag/image | 2022-03-28 |
| [6.5.55](https://github.com/goofball222/unifi/releases/tag/6.5.55) | [6.5.55](https://community.ui.com/releases/UniFi-Network-Application-6-5-55/48c64137-4a4a-41f7-b7e4-3bee505ae16e) | Static official release tag/image | 2021-12-16 |
| [6.4.54](https://github.com/goofball222/unifi/releases/tag/6.4.54) | [6.4.54](https://community.ui.com/releases/UniFi-Network-Application-6-4-54/c1be3b7f-44c4-4d6f-af1e-707bf017110d) | Static official release tag/image | 2021-09-20 |
| [6.2.26](https://github.com/goofball222/unifi/releases/tag/6.2.26) | [6.2.26](https://community.ui.com/releases/UniFi-Network-Application-6-2-25/d9cb0897-3ef4-4dda-a5d6-c07530ff8a86) | Static official release tag/image | 2021-06-24 |
| [6.1.71](https://github.com/goofball222/unifi/releases/tag/6.1.71) | [6.1.71](https://community.ui.com/releases/UniFi-Network-Controller-6-1-71/0cffd3ed-7429-4529-9a20-9fead78ebf66) | Static official release tag/image | 2021-03-25 |
| [6.0.45](https://github.com/goofball222/unifi/releases/tag/6.0.45) | [6.0.45](https://community.ui.com/releases/UniFi-Network-Controller-6-0-45/8d3b98e1-b9d4-4ab3-b8da-721dbe9ab842) | Static official release tag/image | 2021-01-26 |
| [5.14.23](https://github.com/goofball222/unifi/releases/tag/5.14.23) | [5.14.23](https://community.ui.com/releases/UniFi-Network-Controller-5-14-23/daf90732-30ad-48ee-81e7-1dcb374eba2a) | Static official release tag/image | 2020-08-25 |
| [5.13.32](https://github.com/goofball222/unifi/releases/tag/5.13.32) | [5.13.32](https://community.ui.com/releases/UniFi-Network-Controller-5-13-32/85eee834-c987-4875-8de2-51c6842d7bd3) | Static official release tag/image | 2020-07-02 |
| [5.12.72](https://github.com/goofball222/unifi/releases/tag/5.12.72) | [5.12.72](https://community.ui.com/releases/UniFi-Network-Controller-5-12-72/9ac72983-5130-4f58-b3ba-909f4d4bb5f9) | Static official release tag/image | 2020-05-18 |
| [5.11.50](https://github.com/goofball222/unifi/releases/tag/5.11.50) | [5.11.50](https://community.ui.com/releases/UniFi-Network-Controller-5-11-50/1728a1f1-f0a8-45dd-a2e2-95abcfc50dab) | Static official release tag/image | 2019-10-08 |
| [5.6.42](https://github.com/goofball222/unifi/releases/tag/5.6.42) | [5.6.42](https://community.ubnt.com/t5/UniFi-Updates-Blog/UniFi-Network-Controller-5-6-42-Stable-has-been-released/ba-p/2771271) | Static official release tag/image | 2019-05-03 |
</details>

---

* [Recent changes, see: GitHub CHANGELOG.md](https://github.com/goofball222/unifi/blob/main/CHANGELOG.md)
* [Report any bugs, issues or feature requests on GitHub](https://github.com/goofball222/unifi/issues)

---

**NOTE:**
**Alpine tags DO NOT contain any internal MongoDB binaries. You must connect them to an external Mongo DB container or other host instance.**

**2023-12-21:**
[Info and proposed changes for Debian-base MongoDB 3.6 Release Signing Key EXPKEYSIG](https://github.com/goofball222/unifi/issues/132)
**2023-12-20:**
MongoDB 3.6 Debian repo signing key has expired, apt-get refuses to install packages from this repo without setting insecure options.

ALL RELEASES AFTER v8.0.26 WILL BE UPDATED TO USE THE UBUNTU BASED BUILD AS THE LATEST/CURRENT VERISON TAG.
DEBIAN BASE WILL BE MOVED TO A NEWER VERSION OF MONGODB, NON-MONGO BUILD, OR PHASED OUT ENTIRELY IN THE NEAR FUTURE.**

Current beta tags of v8.0.X have been rebuilt with Ubuntu as the default.
Please test and [report any bugs, or issues on GitHub](https://github.com/goofball222/unifi/issues)

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
    ghcr.io/goofball222/unifi
```

---

**Recommended run method: [Docker Compose](https://docs.docker.com/compose/) - UniFi app and internal Mongo DB:**

```bash

version: '3'

services:
  unifi:
    image: ghcr.io/goofball222/unifi
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
#   Use max mongo version 5.0.X. Higher versions are incompatible with the mongo driver built into Unifi.
#   Older versions are acceptable, ie: mongo:3.6
    image: mongo:5.0
    container_name: unifidb
    restart: unless-stopped
#   By default docker-compose will create a new bridge network for the services in the compose file.
#   Enable this to have the services/containers use the existing docker0/default bridge network.
#    network_mode: bridge
    volumes:
      - ./data/db:/data/db

  unifi:
    image: ghcr.io/goofball222/unifi
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
| `LOGSTDOUT` | ***false*** | Set to *true* to enable the (noisy!) UniFi process log output to STDOUT. System will still output to log volume files if configured. |
| `PGID` | ***999*** | Specifies the GID for the container internal unifi group (used for file ownership) |
| `PUID` | ***999*** | Specifies the UID for the container internal unifi user (used for process and file ownership) |
| `READENV` | ***true*** | Set to *false* to disable environment variables conversion to UniFi system.properties settings. |
| `RUN_CHOWN` | ***true*** | Set to *false* to disable the container automatic `chown` at startup. Speeds up startup process on overlay2 Docker hosts. **NB/IMPORTANT:** It's critical that you insure directory/data permissions on all mapped volumes are correct before disabling this or UniFi and/or Mongo will not start. |
| `RUNAS_UID0` | ***false*** | Set to *true* to force the container to run the Java/Mongo processes as UID=0 (root) - workaround for `setcap` AUFS missing xargs failure - **NB/IMPORTANT:** running with this set to "true" is insecure |

Recommended UniFi system.properties converted environment variables to externalize Mongo DB via docker-compose:

| Variable | Recommended Setting | Description |
| :--- | :---: | --- |
| `DB_MONGO_LOCAL` | ***false*** | Setting this to *false* tells UniFi that we're using an external Mongo DB |
| `DB_MONGO_URI` | ***mongodb://mongo:27017/unifi***| This sets the URI that UniFi should connect to for the main configuration database |
| `STATDB_MONGO_URI` | ***mongodb://mongo:27017/unifi_stat*** | This sets the URI that UniFi should connect to for the statistics database |
| `UNIFI_DB_NAME` | ***unifi*** | Sets a database name that can be connected and managed on the external Mongo DB server, must match with the URI variables (IE: unifi, unifi_stat = unifi). |

**NB/IMPORTANT:** Although I've been running my own deployments with an external DB without issue with these settings externalizing the DB, just like running the app itself in a Docker container, is considered experimental and totally unsupported by UBNT. Full documentation for an external DB setup is outside the scope of this README and is left as an exercise for the interested reader. Additional information available on the [UBNT forums in this post](https://community.ubnt.com/t5/UniFi-Wireless/External-MongoDB-Server/m-p/1711073/highlight/true#M188357) and in the PDF post linked below.

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
3. Must contain a PEM format SSL certificate file.
Certificate file **MUST** be named `cert.pem`.
    - For versions prior to 7.3,  the SSL certificate file **MUST** be named `fullchain.pem` and must contain the full certification chain.
      LetsEncrypt handles this automatically, other providers may need manual work (https://www.digicert.com/ssl-support/pem-ssl-creation.htm).
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
