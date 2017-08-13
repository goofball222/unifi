# UniFi Docker Container

[![Docker Build Status](https://img.shields.io/docker/build/goofball222/unifi.svg)](https://hub.docker.com/r/goofball222/unifi/) [![Docker Pulls](https://img.shields.io/docker/pulls/goofball222/unifi.svg)](https://hub.docker.com/r/goofball222/unifi/) [![Docker Stars](https://img.shields.io/docker/stars/goofball222/unifi.svg)](https://hub.docker.com/r/goofball222/unifi/) [![MB Layers](https://images.microbadger.com/badges/image/goofball222/unifi.svg)](https://microbadger.com/images/goofball222/unifi) [![MB Version](https://images.microbadger.com/badges/version/goofball222/unifi.svg)](https://microbadger.com/images/goofball222/unifi) [![MB License](https://images.microbadger.com/badges/license/goofball222/unifi.svg)](https://microbadger.com/images/goofball222/unifi)

## Description

#### Docker container based on Debian Jessie running the Ubiquiti Networks UniFi Controller software

## Docker tags:
| Tag | UniFi Version | Description | Release Date |
| :---: | :---: | --- | :---: |
| latest | 5.5.20 | UniFi latest stable release | 2017-07-31 |
| sc | 5.5.21 | UniFi latest stable candidate release | 2017-08-08 |
| testing | 5.6.14 | UniFi latest testing release | 2017-08-09 |
| unstable | 5.6.12 | UniFi latest unstable release | 2017-07-26 |
| unifi54 | 5.4.19 | UniFi LTS v5.4 latest stable release | 2017-07-17 |
| unifi54-sc | 5.4.19 | UniFi LTS v5.4 latest stable candidate release | 2017-07-07 |
| release-5.5.20 | 5.5.20 | Static stable release tag/image | 2017-07-31 |
| release-5.4.19 | 5.4.19 | Static stable release tag/image | 2017-07-17 |
| release-4.8.20 | 4.8.20 | Static stable release tag/image | 2016-07-06 |

## Changes

2017-08-12:
* All UniFi versions remain unchanged.
* Add build hook script and labels to Dockerfile.
* Switch base to `debain:jessie-slim` image to reduce overall size.
* Change unstable, testing, and sc tags to use bash init-script ENTRYPOINT instead of supervisord. Simplification and size reduction.
* Copy majority of function from UniFi packaged init-script. Change to JSVC for process launch.
* Add support for Java/JSVC environment variable adjustements at container start via --env command line flags.
* **Add SSL Java keystore update functionality.**
* Automated SSL cert import for LetsEncrypt, etc. if full cert chain and private key are present in PEM format.
* See "SSL custom certificate configuration support (LetsEncrypt, etc.)" further along in README.md
* **Note:** Init-script changes will be moved to `latest` tag and the `unifi54` branch after a brief period to insure stability.
* Please report any bugs and/or issues on GitHub: https://github.com/goofball222/unifi

* 2017-08-09: testing tag updated to UniFi 5.6.14
* 2017-08-08: sc tag updated to UniFi 5.5.21
* 2017-07-31: latest tag updated to UniFi 5.5.20, tagged release-5.5.20
* 2017-07-29: lts and lts-sc tags changed to unifi54 and unifi54-sc

---

**MAKE A BACKUP OF YOUR DATA BEFORE INSTALLING UPDATES.**
**Database rollback from newer to older versions isn't always possible.**
**Export a .unf from the web interface and/or stop the current container and make a backup copy of the data volume.**


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

The most basic way to start this container:

```
$ docker run --name unifi -d \
	-p 3478:3478/udp -p 6789:6789 -p 8080:8080 \
	-p 8443:8443 -p 8880:8880 -p 8843:8843 \
	goofball222/unifi
```


Recommended:
Have the container store the config/databases (recommended for persistence), logs on your filesystem instead (recommended for troubleshooting!), and allow for remapping ports with NO layer 2 discovery (layer 3/remote controller):

```
$ docker run --name unifi -d \
	-p 3478:3478/udp -p 6789:6789 -p 8080:8080 \
	-p 8443:8443 -p 8880:8880 -p 8843:8843 \
	-v /path/to/certs:/usr/lib/unifi/cert  \
	-v /path/to/data:/usr/lib/unifi/data  \
	-v /path/to/logs:/usr/lib/unifi/logs \
	goofball222/unifi
```


To enable layer 2/local LAN discovery:

```
$ docker run --name unifi -d \
	-p 3478:3478/udp -p 6789:6789 -p 8080:8080 \
	-p 8443:8443 -p 8880:8880 -p 8843:8843 \
	-p 10001:10001/udp \
	-v /path/to/certs:/usr/lib/unifi/cert  \
	-v /path/to/data:/usr/lib/unifi/data  \
	-v /path/to/logs:/usr/lib/unifi/logs \
	goofball222/unifi
```


Alternative suggested by rogierlommers: 

Use --network=host mode. Does not allow for port remapping. You may need to manually adjust host firewall settings to allow traffic. Running a container in this mode is considered insecure:
**Please make sure to read the "Network: host" section of https://docs.docker.com/engine/reference/run/ and understand the implications of this setting before using.**

```
$ docker run --name unifi -d \
	--network=host \
	-v /path/to/certs:/usr/lib/unifi/cert  \
	-v /path/to/data:/usr/lib/unifi/data  \
	-v /path/to/logs:/usr/lib/unifi/logs \
	goofball222/unifi
```


---

### SSL custom certificate configuration support (LetsEncrypt, etc.)

**Note:** As of 2017-08-12 this feature is only present in the `sc`, `testing`, and `unstable` tags. It will be moved to `latest` tag and the `unifi54` branch once stability is proven.

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
