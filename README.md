# UniFi Docker Container

[![Docker Build Status](https://img.shields.io/docker/build/goofball222/unifi.svg)](https://hub.docker.com/r/goofball222/unifi/) [![Docker Pulls](https://img.shields.io/docker/pulls/goofball222/unifi.svg)](https://hub.docker.com/r/goofball222/unifi/) [![Docker Stars](https://img.shields.io/docker/stars/goofball222/unifi.svg)](https://hub.docker.com/r/goofball222/unifi/) [![MB Layers](https://images.microbadger.com/badges/image/goofball222/unifi.svg)](https://microbadger.com/images/goofball222/unifi) [![MB Commit](https://images.microbadger.com/badges/commit/goofball222/unifi.svg)](https://microbadger.com/images/goofball222/unifi) [![MB License](https://images.microbadger.com/badges/license/goofball222/unifi.svg)](https://microbadger.com/images/goofball222/unifi)

## Docker tags:
| Tag | UniFi Version | Description | Release Date |
| --- | :---: | --- | :---: |
| [latest](https://github.com/goofball222/unifi/blob/master/stable/Dockerfile) | [5.6.30](https://community.ubnt.com/t5/UniFi-Updates-Blog/UniFi-5-6-30-Stable-has-been-released/ba-p/2220761) | UniFi latest stable release | 2018-01-26 |
| [sc](https://github.com/goofball222/unifi/blob/master/sc/Dockerfile) | [5.7.18](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-5-7-18-Stable-Candidate-has-been-released/ba-p/2238507) | UniFi latest stable candidate release | 2018-02-10 |
| [testing](https://github.com/goofball222/unifi/blob/master/testing/Dockerfile) | [5.7.11](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-5-7-11-Testing-has-been-released/ba-p/2180775) | UniFi latest testing release | 2017-12-20 |
| [unstable](https://github.com/goofball222/unifi/blob/master/unstable/Dockerfile) | [5.7.8](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-5-7-8-Unstable-has-been-released/ba-p/2149934) | UniFi latest unstable release | 2017-11-24 |
| [unifi56-sc](https://github.com/goofball222/unifi/blob/unifi56/sc/Dockerfile) | [5.6.35](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-5-6-35-Stable-Candidate-has-been-released/ba-p/2238153) | UniFi v5.6 latest stable candidate release | 2018-02-09 |
| [unifi55](https://github.com/goofball222/unifi/blob/unifi55/stable/Dockerfile) | [5.5.24](https://community.ubnt.com/t5/UniFi-Updates-Blog/UniFi-5-5-24-Stable-has-been-released/ba-p/2086518) | UniFi v5.5 latest stable release | 2017-10-04 |
| [release-5.6.30](https://github.com/goofball222/unifi/releases/tag/5.6.30) | [5.6.30](https://community.ubnt.com/t5/UniFi-Updates-Blog/UniFi-5-6-30-Stable-has-been-released/ba-p/2220761) | Static stable release tag/image | 2018-01-26 |
| [release-5.5.24](https://github.com/goofball222/unifi/releases/tag/5.5.24) | [5.5.24](https://community.ubnt.com/t5/UniFi-Updates-Blog/UniFi-5-5-24-Stable-has-been-released/ba-p/2086518) | Static stable release tag/image | 2017-10-04 |

---

* [Recent changes, see: GitHub CHANGELOG.md](https://github.com/goofball222/unifi/blob/master/CHANGELOG.md)
* [Report any bugs, issues or feature requests on GitHub](https://github.com/goofball222/unifi/issues)

---

\*\*\*Important Update Notice - v5.7.12\*\*\*
Please make sure to upgrade your UniFi APs to firmware v3.9.18.8086 BEFORE upgrading to controller v5.7.12. You can find that firmware [HERE](https://community.ubnt.com/t5/UniFi-Updates-Blog/FIRMWARE-3-9-18-8086-for-UAP-USW-has-been-released/ba-p/2184652). UBNT has an article on updating UniFI device firmware [HERE](https://help.ubnt.com/hc/en-us/articles/204910064-UniFi-Changing-the-Firmware-of-a-UniFi-Device). The quickest/easiest way to do this would be with batch upgrading ([instructions at the end of the v5.7.12 announcement](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-5-7-12-Stable-Candidate-has-been-released/ba-p/2186624)) via the controller ahead of updating to v5.7.12.

---

**AS OF 2017-09-01:** For security/attack surface reduction the container is configured to run the UniFi processes as an internal user & group `unifi` having a pre-set UID & GID of 999.
The container will attempt to adjust permissions on mapped volumes and data to match before dropping privileges to start the UniFi Java and Mongo processes.
If the container is being run with a different Docker --user setting permissions may need to be fixed manually.

IE: `chown -R 999:999 /DATA_VOLUME/unifi/{cert,data,logs}`

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

**Recommended run command line -**

Have the container store the config, databases & logs on a local file-system or in a specific, known data volume (recommended for persistence and troubleshooting) with NO layer 2 discovery (layer 3/remote controller):

```bash
$ docker run --name unifi -d \
    -p 3478:3478/udp -p 8080:8080 -p 8443:8443 \
    -p 8880:8880 -p 8843:8843 \
    -v /DATA_VOLUME/unifi/certs:/usr/lib/unifi/cert  \
    -v /DATA_VOLUME/unifi/data:/usr/lib/unifi/data  \
    -v /DATA_VOLUME/unifi/logs:/usr/lib/unifi/logs \
    goofball222/unifi
```
To enable layer 2 broadcast discovery on a controller container running in the local LAN add:
```bash
    - p 10001:10001/udp \
```
To enable speed tests from the UniFi iOS & Android apps add:
```bash
    - p 6789:6789 \
```
---

**Alternative run command line suggested by [rogierlommers](https://hub.docker.com/r/rogierlommers/) -**

Use --network=host mode. Does not allow for port remapping. You may need to manually adjust host firewall settings to allow traffic. Running a container in this mode is considered insecure:

**Please make sure to read the "NETWORK: HOST" section of the [Docker "run" reference](https://docs.docker.com/engine/reference/run/#network-settings) and understand the implications of this setting before using.**

```bash
$ docker run --name unifi -d \
    --network="host" \
    -v /DATA_VOLUME/unifi/certs:/usr/lib/unifi/cert  \
    -v /DATA_VOLUME/unifi/data:/usr/lib/unifi/data  \
    -v /DATA_VOLUME/unifi/logs:/usr/lib/unifi/logs \
    goofball222/unifi
```

---

**Environment variables:**

| Variable | Default | Description |
| :--- | :---: | --- |
| `BIND_PRIV` | ***false*** | Set to *true* to allow UniFi process to bind to container internal ports <1024 |
| `DEBUG` | ***false*** | Set to *true* for extra container and UniFi verbosity for debugging |
| `JVM_EXTRA_OPTS` | ***unset*** | Any additional custom run flags for the container Java process |
| `JVM_INIT_HEAP_SIZE` | ***unset*** | Sets the start and min memory size for the container Java process (-Xms) |
| `JVM_MAX_HEAP_SIZE` | ***1024M*** | Sets the max memory size for the container Java process (-Xmx) |
| `RUNAS_UID0` | ***false*** | Set to *true* to force the container to run the Java/Mongo processes as UID=0 (root) - workaround for `setcap` AUFS missing xargs failure - **NB/IMPORTANT:** running with this set to "true" is insecure |
| `UNIFI_GID` | ***999*** | Specifies the GID for the container internal unifi group (used for file ownership) |
| `UNIFI_UID` | ***999*** | Specifies the UID for the container internal unifi user (used for process and file ownership) |

Additionally UniFi [system.properties](https://help.ubnt.com/hc/en-us/articles/205202580-UniFi-system-properties-File-Explanation) config file settings can be passed to the container as -e/--env flags at runtime [(more detail and a PDF with UBNT examples here)](https://community.ubnt.com/t5/UniFi-Wireless-Beta/Unifi-Controller-High-Availability/m-p/1801933/highlight/true#M43494). Envrionment variables must be in ALL CAPS and replace "." with "_".

IE:

| system.properties | Environment Variable |
| :--- | :--- |
| unifi.db.extraargs | UNIFI_DB_EXTRAARGS |
| unifi.https.hsts | UNIFI_HTTPS_HSTS |

---

**[Docker Compose](https://docs.docker.com/compose/):**

[Example basic `docker-compose.yml` file](https://raw.githubusercontent.com/goofball222/unifi/master/examples/docker-compose.yml), courtesy of Docker Hub user [jesk](https://hub.docker.com/r/jesk/)

[Example advanced `docker-compose.yml` file](https://raw.githubusercontent.com/goofball222/unifi/master/examples/docker-compose-EXTERNALDB.yml) with external Mongo DB service and UniFi service using environment variables

**NB/IMPORTANT:** Externalizing the DB server and/or using Mongo DB versions > 2.6.12 is highly experimental and completely unsupported by UBNT. Full documentation for an external DB setup is outside the scope of this README and is left as an exercise for the interested reader. Additional information available on the [UBNT forums in this post](https://community.ubnt.com/t5/UniFi-Wireless/External-MongoDB-Server/m-p/1711073/highlight/true#M188357) and in the PDF post linked in the "Environment Variables" section.

---

**SSL custom certificate auto-configuration support ([LetsEncrypt](https://letsencrypt.org/), etc.):**

1. Map the Docker host cert storage location or volume to the `/usr/lib/unifi/cert` volume exposed by the container
2. Must contain a PEM format SSL private key corresponding to the SSL certificate to be installed.
Private key file **MUST** be named `privkey.pem`. 
3. Must contain a PEM format SSL certificate file with the full certification chain. LetsEncrypt handles this automatically, other providers may need manual work (https://www.digicert.com/ssl-support/pem-ssl-creation.htm).
Certificate file **MUST** be named `fullchain.pem`.
4. Start the container. SSL import and Java keystore update process is automated during startup. Status, errors, etc. can be found in the container log, IE: `docker logs <containername>`
5. Existing keystore file will be backed up to  `/usr/lib/unifi/data/keystore-<epochseconds>`
6. Java keystore is only updated when changes to the certificate files are detected. To force a re-import of existing files delete the `unificert.sha256` file in `/DATA_VOLUME/unifi/cert` and restart the container.

If you don't want to use a custom SSL certificate then the `/usr/lib/unifi/cert` volume can be left unmapped. Alternatively if the `privkey.pem` and/or `fullchain.pem` file are not present SSL customization will be skipped.

To revert from a custom cert to a UniFi self-signed certificate stop the container, rename or remove `/DATA_VOLUME/unifi/data/keystore`, and restart the container. The UniFi application will automatically generate a new keystore file with a new self-signed cert.

**NB/IMPORTANT:** This feature is present in all dynamic tags and any static release tags built after 2017-08-21.

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
