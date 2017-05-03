# UniFi Docker

## Description

#### This is a Docker container built for the Ubiquiti Networks UniFi Controller software

## Docker tags:
| Tag | Description |
| --- | --- |
| latest | Tracks UniFi current stable/general availability version - v5.4.15 as of 2017-05-02 |
| sc | Tracks UniFi stable candidate version - v5.4.15 as of 2017-04-20 |
| testing | Tracks UniFi testing version - v5.5.11 as of 2017-04-20 |
| unstable | Tracks UniFi unstable version - v5.6.4 as of 2017-05-02 |
| release-5.4.14 | UniFi v5.4.14 general release, 2017-04-06 |
| release-5.3.11 | UniFi v5.3.11 general release, 2017-01-09 |
| release-4.8.20 | UniFi v4.8.20 general release, 2016-07-06 |

## Notes

Changes 2017-05-02:
* unstable updated to v5.6.4 - https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-5-6-4-Unstable-has-been-released/ba-p/1910934
* v5.4.15 is now general release/stable: https://community.ubnt.com/t5/UniFi-Updates-Blog/UniFi-5-4-15-Stable-has-been-released/ba-p/1910910
* latest tag updated to v5.4.15, tagged release-5.4.15

---

Changes 2017-04-20:
* NOTE: Still two stable candidate releases running simultaneously
* sc updated to v5.4.15 - https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-5-4-15-Stable-Candidate-has-been-released/ba-p/1903843
* testing updated to v5.5.11, however this is a **stable candidate** (sc) - https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-5-5-11-Stable-Candidate-has-been-released/ba-p/1903839
* unstable updated to v5.6.3 - https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-5-6-3-Unstable-has-been-released/ba-p/1903835

---

**MAKE A BACKUP OF YOUR DATA BEFORE INSTALLING UPDATES.**
**Database rollback from newer to older versions isn't always possible.**
**Export a .unf from the web interface and/or stop the current container and make a backup copy of the data volume.**


## Usage

This container exposes two volumes:
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
	-v /path/to/data:/usr/lib/unifi/data  \
	-v /path/to/logs:/usr/lib/unifi/logs \
	goofball222/unifi
```


---

## unstable/testing tag Notes

**NOT RECOMMENDED FOR USE IN A PRODUCTION ENVIRONMENT - FOR TESTING/LAB ONLY**

_There have been past UniFi alpha/beta releases with AP bricking firmware, network breaking bugs, etc._

_Proceed with caution! Use at your own risk._

If you're going to use these images please make sure you create a UBNT community account:
https://community.ubnt.com/

Sign up for Beta access at:
https://account.ubnt.com/manage/settings/beta

That way you can participate in discussion and create bug reports for any issues you may encounter in:
https://community.ubnt.com/t5/UniFi-Wireless-Beta/bd-p/UniFi_Beta

**AGAIN: USE UNSTABLE/TESTING AT YOUR OWN RISK - NOT RECOMMENDED FOR USE IN A PRODUCTION ENVIRONMENT**

[//]: # (Licensed under the Apache 2.0 license)
[//]: # (Copyright 2016 The Goofball - goofball222@gmail.com)
