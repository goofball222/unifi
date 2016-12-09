# UniFi Docker

## Description

#### This is a Docker container built for the Ubiquiti Networks UniFi Controller software

## Docker tags:
| Tag | Description |
| --- | --- |
| latest | Tracks UniFi latest stable/general availability version - v5.3.8 as of 2016-12-06 |
| lts | Tracks UniFi Long Term Support latest version - v4.8.20 as of 2016-07-06 |
| testing | Tracks UniFi testing/stable candidate versions - v5.3.9 as of 2016-12-08 |
| unstable | Tracks UniFi unstable versions - v5.4.6 as of 2016-12-08 |
| release-5.3.8 | UniFi v5.3.8 General Release, 2016-12-06 |
| release-4.8.20 | UniFi v4.8.20 General Release, 2016-07-06 |

## Important notes

Changes 2016-12-07: 
* v5.3.8 is now general release/stable: https://community.ubnt.com/t5/UniFi-Updates-Blog/UniFi-5-3-8-Stable-has-been-released/ba-p/1755779
* Updated latest tag version and added a release-5.3.8 tag.
* Switched Java in all tags except lts from openjdk-7-jre-headless to openjdk-8-jre-headless from jessie-backports to match UBNT recommended version 8.

Changes 2016-10-03:
* v5.2.9 is now general release/stable: http://community.ubnt.com/t5/UniFi-Updates-Blog/UniFi-5-2-9-is-released/ba-p/1694199
* Removed all but most recent release tags from README.md - Previous release builds/tags still available in Docker hub
* Dropped unstable4 tag - Plan to create a new testing-lts tag if any more LTS releases are made (security updates, bugfixes, etc.).

* Additional info (beta signup required): http://community.ubnt.com/t5/UniFi-Wireless-Beta/UniFi-Stable-Stable-Candidate-SC-Testing-Unstable-Release-Cycle/m-p/1368458


**MAKE A BACKUP OF YOUR DATA BEFORE INSTALLING UPDATES.**

**Database rollback from newer to older versions isn't always possible.**

**Export a .unf from the web interface and/or stop the current container and make a backup copy of the data volume.**


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

## unstable/testing tag notes

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
