# UniFi Docker

## Description

#### This is a Docker container built for the Ubiquiti Networks UniFi Controller software

## Available Docker tags:
| Tag | Description |
| --- | --- |
| latest-5.0 | Tracks UniFi Release Candidate/beta/alpha 5.0 versions (v5.0.1-alpha as of 2016-04-29) |
| latest | Tracks UniFi Release Candidate/beta/alpha versions (v4.9.4-beta as of 2016-04-16) |
| stable | Tracks UniFi latest General Release version (v4.8.18 as of 2016-05-05) |

## Important notes

**Always stop the existing container and make a backup copy of your UniFi data before installing newer images.**

## Usage

This container is configured to look for the configuration files/database in `/usr/lib/unifi/data`.

UniFi/MongoDB log files are located in `/usr/lib/unifi/logs`

The most basic way to run this container is as follows:

```bash
$ docker run --name unifi -d -p 8080:8080 -p 8443:8443 -p 8880:8880 -p 8843:8843 \
	goofball222/unifi
```

This container exposes three volumes:
/usr/lib/unifi/data - UniFi configuration data and DBs
/usr/lib/unifi/logs - UniFi and MongoDB logs for troubleshooting
/var/log/supervise - supervise process logs in the event of a failure

To have the container store the config/databases (recomended for persistence) 
and logs on your filesystem instead (recommeded for troubleshooting!), run:

```bash
$ docker run --name unifi -d -p 8080:8080 -p 8443:8443 -p 8880:8880 -p 8843:8843 \
	-v /path/to/data:/usr/lib/unifi/data  \
	-v /path/to/logs:/usr/lib/unifi/logs \
	-v /path/to/supv/logs:/var/log/supervise \
	goofball222/unifi
```

---

## bleedingedge/latest/latest-5.0 tag build notes

**DO NOT USE THIS IN A PRODUCTION ENVIRONMENT - FOR TESTING ONLY**

_There have been past UniFi alpha/beta releases with AP bricking firmware, network breaking bugs, etc._

_Proceed with caution! Use at your own risk._

If you're going to use this image please make sure you create a UBNT community account:
https://community.ubnt.com/

Sign up for Beta access at:
https://account.ubnt.com/manage/settings/beta

That way you can participate in discussion and create bug reports for any issues you may encounter in:
https://community.ubnt.com/t5/UniFi-Wireless-Beta/bd-p/UniFi_Beta

**AGAIN: USE AT YOUR OWN RISK - DO NOT USE THIS IN A PRODUCTION ENVIRONMENT**
