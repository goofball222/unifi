# UniFi Docker Container

[![Docker Build Status](https://img.shields.io/docker/build/goofball222/unifi.svg)](https://hub.docker.com/r/goofball222/unifi/) [![Docker Pulls](https://img.shields.io/docker/pulls/goofball222/unifi.svg)](https://hub.docker.com/r/goofball222/unifi/) [![Docker Stars](https://img.shields.io/docker/stars/goofball222/unifi.svg)](https://hub.docker.com/r/goofball222/unifi/) [![MB Layers](https://images.microbadger.com/badges/image/goofball222/unifi.svg)](https://microbadger.com/images/goofball222/unifi) [![MB Commit](https://images.microbadger.com/badges/commit/goofball222/unifi.svg)](https://microbadger.com/images/goofball222/unifi) [![MB License](https://images.microbadger.com/badges/license/goofball222/unifi.svg)](https://microbadger.com/images/goofball222/unifi)

## Docker tags:
| Tag | UniFi Version | Description | Release Date |
| --- | :---: | --- | :---: |
| [latest](https://github.com/goofball222/unifi/blob/master/stable/Dockerfile) | [5.5.20](https://community.ubnt.com/t5/UniFi-Updates-Blog/UniFi-5-5-20-Stable-has-been-released/ba-p/2011817) | UniFi latest stable release | 2017-07-31 |
| [sc](https://github.com/goofball222/unifi/blob/master/sc/Dockerfile) | [5.5.21](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-5-5-21-Stable-Candidate-has-been-released/ba-p/2021171) | UniFi latest stable candidate release | 2017-08-08 |
| [testing](https://github.com/goofball222/unifi/blob/master/testing/Dockerfile) | [5.6.14](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-5-6-14-Testing-has-been-released/ba-p/2022323) | UniFi latest testing release | 2017-08-09 |
| [unstable](https://github.com/goofball222/unifi/blob/master/unstable/Dockerfile) | [5.6.12](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-5-6-12-Unstable-has-been-released/ba-p/2005576) | UniFi latest unstable release | 2017-07-26 |
| [unifi54](https://github.com/goofball222/unifi/blob/unifi54/stable/Dockerfile) | [5.4.19](https://community.ubnt.com/t5/UniFi-Updates-Blog/UniFi-5-4-19-Stable-has-been-released/ba-p/1995714) | UniFi LTS v5.4 latest stable release | 2017-07-17 |
| [unifi54-sc](https://github.com/goofball222/unifi/blob/unifi54/sc/Dockerfile) | [5.4.19](https://community.ubnt.com/t5/UniFi-Updates-Blog/UniFi-5-4-19-Stable-Candidate-has-been-released/ba-p/1990323) | UniFi LTS v5.4 latest stable candidate release | 2017-07-07 |
| [release-5.5.20](https://github.com/goofball222/unifi/releases/tag/5.5.20) | [5.5.20](https://community.ubnt.com/t5/UniFi-Updates-Blog/UniFi-5-5-20-Stable-has-been-released/ba-p/2011817) | Static stable release tag/image | 2017-07-31 |
| [release-5.4.19](https://github.com/goofball222/unifi/releases/tag/5.4.19) | [5.4.19](https://community.ubnt.com/t5/UniFi-Updates-Blog/UniFi-5-4-19-Stable-has-been-released/ba-p/1995714) | Static stable release tag/image | 2017-07-17 |

---

* **2017-08-15:**
    * All UniFi versions remain unchanged.
    * Moved "Changes" to [GitHub CHANGELOG.md](https://github.com/goofball222/unifi/blob/master/CHANGELOG.md) file.
    * Please report any bugs and/or issues on GitHub: https://github.com/goofball222/unifi/issues
---

**MAKE A BACKUP OF YOUR DATA BEFORE INSTALLING UPDATES.**
**Database rollback from newer to older versions isn't always possible.**
**Export a .unf from the web interface and/or stop the current container and make a backup copy of the data volume.**

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

**The most basic way to start this container:**

```
$ docker run --name unifi -d \
	-p 3478:3478/udp -p 6789:6789 -p 8080:8080 \
	-p 8443:8443 -p 8880:8880 -p 8843:8843 \
	goofball222/unifi
```  
---

**Recommended:**
Have the container store the config/databases (recommended for persistence), logs on your filesystem instead (recommended for troubleshooting!), and allow for remapping ports with NO layer 2 discovery (layer 3/remote controller):

```
$ docker run --name unifi -d \
	-p 3478:3478/udp -p 6789:6789 -p 8080:8080 \
	-p 8443:8443 -p 8880:8880 -p 8843:8843 \
	-v /path/to/unifi/certs:/usr/lib/unifi/cert  \
	-v /path/to/unifi/data:/usr/lib/unifi/data  \
	-v /path/to/unifi/logs:/usr/lib/unifi/logs \
	goofball222/unifi
```
---

**To enable layer 2/local LAN discovery:**

```
$ docker run --name unifi -d \
	-p 3478:3478/udp -p 6789:6789 -p 8080:8080 \
	-p 8443:8443 -p 8880:8880 -p 8843:8843 \
	-p 10001:10001/udp \
	-v /path/to/unifi/certs:/usr/lib/unifi/cert  \
	-v /path/to/unifi/data:/usr/lib/unifi/data  \
	-v /path/to/unifi/logs:/usr/lib/unifi/logs \
	goofball222/unifi
```
---

**Alternative suggested by [rogierlommers](https://hub.docker.com/r/rogierlommers/):**

Use --network=host mode. Does not allow for port remapping. You may need to manually adjust host firewall settings to allow traffic. Running a container in this mode is considered insecure:
**Please make sure to read the "Network: host" section of https://docs.docker.com/engine/reference/run/ and understand the implications of this setting before using.**

```
$ docker run --name unifi -d \
	--network=host \
	-v /path/to/unifi/certs:/usr/lib/unifi/cert  \
	-v /path/to/unifi/data:/usr/lib/unifi/data  \
	-v /path/to/unifi/logs:/usr/lib/unifi/logs \
	goofball222/unifi
```
---

**Example `docker-compose.yml` file for use with [Docker Compose](https://docs.docker.com/compose/), courtesy of Docker Hub user [jesk](https://hub.docker.com/r/jesk/):**

```
version: '2'
services:
  unifi:
    image: "goofball222/unifi:latest"
    ports:
     - "3478:3478/udp"
     - "6789:6789"
     - "8080:8080"
     - "8443:8443"
     - "8880:8880"
     - "8843:8843"
     - "10001:10001/udp"
    volumes:
     - /path/to/unifi/certs:/usr/lib/unifi/cert
     - /path/to/unifi/data:/usr/lib/unifi/data
     - /path/to/unifi/logs:/usr/lib/unifi/logs
```
---


### SSL custom certificate configuration support ([LetsEncrypt](https://letsencrypt.org/), etc.)

**Note:** As of 2017-08-15 this feature is only present in the `sc`, `testing`, `unstable`, and `unifi54-sc` tags. It will be moved to `latest` tag and the `unifi54` tag once stability is proven.

1. Map the Docker host cert storage location or volume to the `/usr/lib/unifi/cert` volume exposed by the container
2. Must contain a PEM format SSL private key corresponding to the SSL certificate to be installed.
Private key file **MUST** be named `privkey.pem`. 
3. Must contain a PEM format SSL certificate file with the full certification chain. LetsEncrypt handles this automatically, other providers may need manual work (https://www.digicert.com/ssl-support/pem-ssl-creation.htm).
Certificate file **MUST** be named `fullchain.pem`.
4. Start the container. SSL import and Java keystore update process is automated by init-script. Status, errors, etc. can be found in the container log, IE: `docker logs goofball222-unifi`
5. Existing keystore file will be backed up to  `/usr/lib/unifi/data/keystore-<epochseconds>`
6. Java keystore is only updated when changes to the certificate files are detected. To force a re-import of existing files delete the `unificert.sha256` file in `/usr/lib/unifi/cert` and restart the container.

If you don't want to use a custom SSL certificate then the `/usr/lib/unifi/cert` volume can be left unmapped. Alternatively if the `privkey.pem` and/or `fullchain.pem` file are not present SSL customization will be skipped.

To revert from a custom cert to a UniFi self-signed certificate stop the container, rename `/usr/lib/unifi/data/keystore`, and restart the container. The UniFi application will automatically generate a new keystore file with a new self-signed cert.

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
