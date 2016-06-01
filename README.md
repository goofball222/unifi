# UniFi Docker

## Description

#### This is a Docker container built for the Ubiquiti Networks UniFi Controller software

## Docker tags:
| Tag | Description |
| --- | --- |
| latest/stable | Tracks UniFi current General Release version (v5.0.6 as of 2016-06-01) |
| lts | Tracks UniFi Long Term Support Release version (v4.8.18 as of 2016-06-01) |
| unstable | Tracks UniFi Release Candidate/beta/alpha versions (v5.0.6-RC as of 2016-05-31) |
| release-5.0.6 | UniFi v5.0.6 General Release, released 2016-06-01 |
| release-4.8.18 | UniFi v4.8.18 General Release, released 2016-05-05 |

## Important notes

**Always stop the existing container and make a backup copy of your UniFi data before installing newer images.**

Changes 2016-06-01: 
* v5.0.6 is now in general release: http://community.ubnt.com/t5/UniFi-Updates-Blog/UniFi-5-0-6-is-released/ba-p/1579716 
* MAKE A BACKUP OF YOUR DATA BEFORE INSTALLING VERSION 5. Database rollback from v5.X to v4.x is not possible, it requires a data restore.
* Shifted v4.8.X and Alpha/Beta/RC Dockerfiles into subfolders instead of branches, messy to maintain. 
* Start tagging v4 and v5 releases as they happen.
* Repoint "latest" and "stable" tags to v5.X releases 
* Move alpha/beta/RC to "unstable" tag moving forward
* Add "lts" tag tracking Long Term Support version

Changes 2016-05-20: 
* v4.9.4-beta, released 2016-04-16 is the last v4.9.X release.
* All fixes and updates from v4.9.4 and onward are being rolled into v5.0 and prepped for general release.
* See: https://community.ubnt.com/t5/UniFi-Wireless/UniFi-Release-Schedule-and-LTS/m-p/1554264

## Usage

This container is configured to look for the configuration files/database in `/usr/lib/unifi/data`.

UniFi/MongoDB log files are located in `/usr/lib/unifi/logs`

The most basic way to run this container is as follows:

```bash
$ docker run --name unifi -d -p 8080:8080 -p 8443:8443 -p 8880:8880 -p 8843:8843 \
	goofball222/unifi
```

This container exposes three volumes:
* /usr/lib/unifi/data - UniFi configuration data and DBs
* /usr/lib/unifi/logs - UniFi and MongoDB logs for troubleshooting
* /var/log/supervisor - supervisor process logs in the event of a failure

To have the container store the config/databases (recommended for persistence) 
and logs on your filesystem instead (recommended for troubleshooting!), run:

```bash
$ docker run --name unifi -d -p 8080:8080 -p 8443:8443 -p 8880:8880 -p 8843:8843 \
	-v /path/to/data:/usr/lib/unifi/data  \
	-v /path/to/logs:/usr/lib/unifi/logs \
	-v /path/to/supv/logs:/var/log/supervisor \
	goofball222/unifi
```

---

## unstable tag notes

**DO NOT USE THIS IN A PRODUCTION ENVIRONMENT - FOR TESTING ONLY**

_There have been past UniFi alpha/beta releases with AP bricking firmware, network breaking bugs, etc._

_Proceed with caution! Use at your own risk._

If you're going to use this image please make sure you create a UBNT community account:
https://community.ubnt.com/

Sign up for Beta access at:
https://account.ubnt.com/manage/settings/beta

That way you can participate in discussion and create bug reports for any issues you may encounter in:
https://community.ubnt.com/t5/UniFi-Wireless-Beta/bd-p/UniFi_Beta

**AGAIN: USE UNSTABLE AT YOUR OWN RISK - DO NOT USE IT IN A PRODUCTION ENVIRONMENT**
