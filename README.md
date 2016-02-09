# UniFi Docker

## Description

This is a Docker container built for the UniFi Controller software (Ubiquiti Networks)
Latest stable UniFi version is v4.8.12.

It's configured to look for the configuration files/database in `/usr/lib/unifi/data`.

UniFi/MongoDB log files are located in `/usr/lib/unifi/logs`

## Usage

The basic way to run this container is as follows:

```bash
$ docker run -d --name=unifi -p 8080:8080 -p 8443:8443 -p 8880:8880 -p 8843:8843 \
	goofball222/unifi
```

This container exposes three volumes:
/usr/lib/unifi/data - UniFi configuration data and DBs
/usr/lib/unifi/logs - UniFi and MongoDB logs for troubleshooting
/var/log/supervise - supervise process logs in the event of a failure

To have the container store the config/databases (recomended for persistence) 
and logs on your filesystem instead (recommeded for troubleshooting!), run:

```bash
$ docker run -d --name=unifi -p 8080:8080 -p 8443:8443 -p 8880:8880 -p 8843:8843 \
	-v /path/to/data:/usr/lib/unifi/data  \
	-v /path/to/logs:/usr/lib/unifi/logs \
	-v /path/to/supv/logs:/var/log/supervise \
	goofball222/unifi
```

## Important notes

***Always stop the existing container and make a back up copy of your UniFi data before installing newer images.***

