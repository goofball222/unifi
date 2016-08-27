# UniFi Docker

## Description

#### This is a Docker container built for the Ubiquiti Networks UniFi Controller software

## Docker tags:
| Tag | Description |
| --- | --- |
| latest | Tracks UniFi General Release latest version (v5.0.7 as of 2016-06-08) |
| lts | Tracks UniFi Long Term Support latest version (v4.8.20 as of 2016-07-06) |
| unstable | Tracks UniFi Release Candidate/beta/alpha versions (v5.2.3 as of 2016-08-16) |
| unstable4 | Tracks UniFi v4 Release Candidate/beta/alpha versions (v4.8.20 as of 2016-06-22) |
| unstable53 | Tracks UniFi v5.3.X Release Candidate/beta/alpha versions (v5.3.2 as of 2016-08-26) |
| release-5.0.7 | UniFi v5.0.7 General Release, 2016-06-08 |
| release-5.0.6 | UniFi v5.0.6 General Release, 2016-06-01 |
| release-4.8.20 | UniFi v4.8.20 General Release, 2016-07-06 |
| release-4.8.18 | UniFi v4.8.18 General Release, 2016-05-05 |

## Important notes

**Always stop the existing container and make a backup copy of your UniFi data before installing newer images.**

Changes 2016-06-01: 
* v5.0.6 is now in general release: http://community.ubnt.com/t5/UniFi-Updates-Blog/UniFi-5-0-6-is-released/ba-p/1579716 
* MAKE A BACKUP OF YOUR DATA BEFORE INSTALLING VERSION 5. Database rollback from v5.X.X to v4.X or lower is not possible, it requires a data restore.
* Repoint github master and "latest" tag to v5.X.X releases 
* Move alpha/beta/RC to "unstable" branch moving forward
* Add "lts" branch tracking v4.8.X Long Term Support versions
* Start tagging stable and lts releases as they happen.
* **If you want/need to stay on v4.8.X you should use the "lts" image or specific release image tag you want.

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
