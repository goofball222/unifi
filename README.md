
# UniFi Docker Container

[![Docker Pulls](https://img.shields.io/docker/pulls/goofball222/unifi.svg)](https://hub.docker.com/r/goofball222/unifi/) [![Docker Stars](https://img.shields.io/docker/stars/goofball222/unifi.svg)](https://hub.docker.com/r/goofball222/unifi/) [![MB Layers](https://images.microbadger.com/badges/image/goofball222/unifi.svg)](https://microbadger.com/images/goofball222/unifi) [![MB Commit](https://images.microbadger.com/badges/commit/goofball222/unifi.svg)](https://microbadger.com/images/goofball222/unifi) [![MB License](https://images.microbadger.com/badges/license/goofball222/unifi.svg)](https://microbadger.com/images/goofball222/unifi)

## Docker tags:
| Tag | UniFi Version | Description | Release Date |
| --- | :---: | --- | :---: |
| [latest](https://github.com/goofball222/unifi/blob/master/5.8/stable/Dockerfile.debian) | [5.8.28](https://community.ubnt.com/t5/UniFi-Updates-Blog/UniFi-SDN-Controller-5-8-28-Stable-has-been-released/ba-p/2449036) | UniFi latest stable release | 2018-08-24 |
| [sc](https://github.com/goofball222/unifi/blob/master/5.9/sc/Dockerfile.debian) | [5.9.24](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-SDN-Controller-5-9-24-Stable-Candidate-has-been-released/ba-p/2464949) | UniFi v5.9 stable candidate release | 2018-08-24 |
| [sc-alpine](https://github.com/goofball222/unifi/blob/master/5.9/sc/Dockerfile.alpine) | [5.9.24](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-SDN-Controller-5-9-24-Stable-Candidate-has-been-released/ba-p/2464949) | UniFi v5.9 stable candidate release, Alpine base, **NO MONGO** | 2018-08-24 |
| [sc-debian-nomongo](https://github.com/goofball222/unifi/blob/master/5.9/sc/Dockerfile.debian.nomongo) | [5.9.24](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-SDN-Controller-5-9-24-Stable-Candidate-has-been-released/ba-p/2464949) | UniFi v5.9 stable candidate release, **NO MONGO** | 2018-08-24 |
| [unifi58](https://github.com/goofball222/unifi/blob/master/5.8/stable/Dockerfile.debian) | [5.8.28](https://community.ubnt.com/t5/UniFi-Updates-Blog/UniFi-SDN-Controller-5-8-28-Stable-has-been-released/ba-p/2449036) | UniFi v5.8 latest stable release | 2018-08-24 |
| [unifi58-alpine](https://github.com/goofball222/unifi/blob/master/5.8/stable/Dockerfile.alpine) | [5.8.28](https://community.ubnt.com/t5/UniFi-Updates-Blog/UniFi-SDN-Controller-5-8-28-Stable-has-been-released/ba-p/2449036) | UniFi v5.8 latest stable release, Alpine base, **NO MONGO** | 2018-08-24 |
| [unifi58-debian-nomongo](https://github.com/goofball222/unifi/blob/master/5.8/stable/Dockerfile.debian.nomongo) | [5.8.28](https://community.ubnt.com/t5/UniFi-Updates-Blog/UniFi-SDN-Controller-5-8-28-Stable-has-been-released/ba-p/2449036) | UniFi v5.8 latest stable release, **NO MONGO** | 2018-08-24 |
| [unifi58-sc](https://github.com/goofball222/unifi/blob/master/5.8/sc/Dockerfile.debian) | [5.8.30](https://community.ubnt.com/t5/UniFi-Updates-Blog/UniFi-SDN-Controller-5-8-30-Stable-Candidate-has-been-released/ba-p/2488240) | UniFi v5.8 latest stable candidate | 2018-09-10 |
| [unifi58-sc-alpine](https://github.com/goofball222/unifi/blob/master/5.8/sc/Dockerfile.alpine) | [5.8.30](https://community.ubnt.com/t5/UniFi-Updates-Blog/UniFi-SDN-Controller-5-8-30-Stable-Candidate-has-been-released/ba-p/2488240) | UniFi v5.8 latest stable candidate, Alpine base, **NO MONGO** | 2018-09-10 |
| [unifi58-sc-debian-nomongo](https://github.com/goofball222/unifi/blob/master/5.8/sc/Dockerfile.debian.nomongo) | [5.8.30](https://community.ubnt.com/t5/UniFi-Updates-Blog/UniFi-SDN-Controller-5-8-30-Stable-Candidate-has-been-released/ba-p/2488240) | UniFi v5.8 latest stable candidate, **NO MONGO** | 2018-09-10 |
| [unifi56](https://github.com/goofball222/unifi/blob/master/5.6/stable/Dockerfile.debian) | [5.6.40](https://community.ubnt.com/t5/UniFi-Updates-Blog/UniFi-SDN-Controller-5-6-40-LTS-Stable-has-been-released/ba-p/2488202) | UniFi v5.6 latest stable release | 2018-09-10 |
| [unifi56-alpine](https://github.com/goofball222/unifi/blob/master/5.6/stable/Dockerfile.alpine) | [5.6.40](https://community.ubnt.com/t5/UniFi-Updates-Blog/UniFi-SDN-Controller-5-6-40-LTS-Stable-has-been-released/ba-p/2488202) | UniFi v5.6 latest stable release, Alpine base, **NO MONGO** | 2018-09-10 |
| [unifi56-debian-nomongo](https://github.com/goofball222/unifi/blob/master/5.6/stable/Dockerfile.debian.nomongo) | [5.6.40](https://community.ubnt.com/t5/UniFi-Updates-Blog/UniFi-SDN-Controller-5-6-40-LTS-Stable-has-been-released/ba-p/2488202) | UniFi v5.6 latest stable release, **NO MONGO** | 2018-09-10 |
| [release-5.8.28](https://github.com/goofball222/unifi/releases/tag/5.8.28) | [5.8.28](https://community.ubnt.com/t5/UniFi-Updates-Blog/UniFi-SDN-Controller-5-8-28-Stable-has-been-released/ba-p/2449036) | Static stable release tag/image | 2018-08-08 |
| [release-5.6.40](https://github.com/goofball222/unifi/releases/tag/5.6.40) | [5.6.40](https://community.ubnt.com/t5/UniFi-Updates-Blog/UniFi-SDN-Controller-5-6-40-LTS-Stable-has-been-released/ba-p/2488202) | Static stable release tag/image | 2018-09-10 |

---

* [Recent changes, see: GitHub CHANGELOG.md](https://github.com/goofball222/unifi/blob/master/CHANGELOG.md)
* [Report any bugs, issues or feature requests on GitHub](https://github.com/goofball222/unifi/issues)

---

**NOTE:**

**Alpine and -nomongo tags DO NOT contain any internal MongoDB binaries. You must connect them to an external Mongo DB container or other host instance.**

2018-08-21:
* Changes in structure in git/GitHub. See [CHANGELOG.md](https://github.com/goofball222/unifi/blob/master/CHANGELOG.md)
* Update tag naming conventions:
    * alpine-sc is now sc-alpine. Future Alpine builds will be *-alpine, IE: stable-alpine, latest-alpine, unifi58-alpine etc.
    * *-nom is now *-debian-nomongo. Writing the entire thing out better clarifies what modification it has.
    * Any future new build tags will follow the `releasetype-os{-mods}` format.

2018-08-13:
* Added experimental images/tags using Alpine Linux as the base: alpine-sc
* Renamed UNIFI_GID and UNIFI_UID variables to PGID and PUID respectively.
* Preliminary build of Debian based images/tags without Mongo included. Naming convention *-nom, IE: sc-nom, unifi58-nom, unifi56-nom
    * These DO NOT contain an internal Mongo process. You must connect them to an external Mongo DB container or host instance.
* Added option to skip automatic `chown` during startup. Helps start speed on overlay2 Docker hosts.
* Added log message warnings about pending future removal of Mongo from container. You can still run this as an all-in-one on current tags, however I highly recommend moving over to a single-service per container setup with Mongo externalized.


v5.9+: Ubiquiti changed the SSL certificate handling internally. If you're using a custom LetsEncrypt, etc. SSL certificate and upgrade to v5.9+ you will need to rename/remove the file `unificert.sha256` in `./cert:/usr/lib/unifi/cert` and restart the container to force a re-import of the existing certificate files under the changed keystore alias.

Additional info at https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-5-9-4-Unstable-has-been-released/ba-p/2339206

v5.7+ discontinues support for the following hardware, if you have any of these devices in production you need to remain on v5.6:
* PicoM2 converted to UniFi
* UAP-AC
* UAP-AC v2
* UAP-AC-Outdoor

More information at https://community.ubnt.com/t5/UniFi-Updates-Blog/UniFi-5-7-20-Release-Update/ba-p/2278500

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

[Example basic `docker-compose.yml` in file form](https://raw.githubusercontent.com/goofball222/unifi/master/examples/docker-compose.yml).

[Example advanced `docker-compose.yml` in file form](https://raw.githubusercontent.com/goofball222/unifi/master/examples/docker-compose.externaldb.yml) with external Mongo DB service and UniFi service using environment variables.

---

**Environment variables:**

| Variable | Default | Description |
| :--- | :---: | --- |
| `BIND_PRIV` | ***false*** | Set to *true* to allow UniFi process to bind to container internal ports <1024 |
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
4. Start the container. SSL import and Java keystore update process is automated during startup. Status, errors, etc. can be found in the container log, IE: `docker logs <containername>`
5. Existing keystore file will be backed up to  `/usr/lib/unifi/data/keystore-<epochseconds>`
6. Java keystore is only updated when changes to the certificate files are detected. To force a re-import of existing files delete the `unificert.sha256` file in `./cert` and restart the container.

If you don't want to use a custom SSL certificate then the `/usr/lib/unifi/cert` volume can be left unmapped. Alternatively if the `privkey.pem` and/or `fullchain.pem` file are not present SSL customization will be skipped.

To revert from a custom cert to a UniFi self-signed certificate stop the container, rename or remove `./data/keystore`, and restart the container. The UniFi application will automatically generate a new keystore file with a new self-signed cert.

---

## unstable/testing/sc tag warning

**NOT RECOMMENDED FOR USE IN A PRODUCTION ENVIRONMENT - FOR TESTING/LABS ONLY**

_There have been past UniFi unstable/testing/stable candidate releases with AP bricking firmware, network breaking bugs, etc._

_Proceed with caution! Use at your own risk._

If you're going to use these images please make sure you create a UBNT community account:
https://community.ubnt.com/

Sign up for Beta access at:
https://account.ubnt.com/manage/settings/beta

Participate in discussion and create bug reports for any issues you may encounter in:
https://community.ubnt.com/t5/UniFi-Wireless-Beta/bd-p/UniFi_Beta

**USE UNSTABLE/TESTING/SC AT YOUR OWN RISK - DO NOT USE IN A PRODUCTION ENVIRONMENT**

[//]: # (Licensed under the Apache 2.0 license)
[//]: # (Copyright 2017 The Goofball - goofball222@gmail.com)
