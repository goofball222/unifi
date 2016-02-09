# UniFi Docker

## Description

This is a Docker container built for the UniFi Controller software (Ubiquiti Networks)
Latest available stable version is v4.8.12.

It's configured to look for the configuration files/database in `/usr/lib/unifi`.

Process log files are located in `/usr/lib/unifi/logs`

## Usage

The recommended way to run this container is as follows:

```bash
$ docker run -d --name=unifi -p 8080:8080 -p 8443:8443 -p 8880:8880 -p 8843:8843 \
	goofball222/unifi
```

To have the container store the config/databases and logs on your filesystem instead (recommeded for troubleshooting!), you
can run:

```bash
$ docker run -d --name=unifi  -p 8080:8080 -p 8443:8443 -p 8880:8880 -p 8843:8843 \
	-v /path/to/data:/usr/lib/unifi \
	goofball222/unifi
```

## Important notes

***Always stop the existing container and make a back up copy of your UniFi data before installing newer images.***

