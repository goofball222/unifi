* **2017-09-01:**
    * Update sc VERSION to [5.5.23](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-5-5-23-Stable-Candidate-has-been-released/ba-p/2049377)
    * Update testing VERSION to [5.6.16](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-5-6-16-Testing-has-been-released/ba-p/2049379)
    * Update Dockerfile to reduce size and default run as non-root user to reduce attack vector.
        * Drop jsvc, don't need an init/service manager in a container
        * Switch to correct MongoDB repository, mongod version in completed image is now 2.6.12 (was 2.4.10)
        * Use mongodb-org-server package to further reduce compressed image space (~-50MB!)
        * Create mongodb and unifi users/groups with known UID/GID
        * Specifically create all needed /usr/lib/unifi subdirectories
        * Recursively change ownership of /usr/lib/unifi to unifi:unifi (999:999)
        * Remove unneeded/unused environment variables
        * Instead of "ADD", "COPY" multiple files to /usr/lib/unifi from "./files"
        * Add USER setting to default to run as 'unifi' user
    * Update unifi-init script to 0.3.2
        * Moved to files/bin/ subfolder
        * Remove unneeded/unused environment variables
        * Add system.properties setup functionality to insure UniFi container mode is on
        * Simplify SSL setup if keystore not present, default now built via java keytool.
        * Drop JSVC, term_handler, wait, etc., process term/zombie reaping now all correctly handled by Docker --init or java process
        * Don't background java process, unifi.logStdout=true in system.properties outputs to "docker logs containername"
        * Formatting adjustments, cleanup
    * Add files/system.properties.default, contains default settings for UniFi "container" mode
    * Update Makefile to use OTHER variable for additional Docker launch options
---
* **2017-08-26:**
    * Update sc VERSION to [v5.5.22](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-5-5-22-Stable-Candidate-has-been-released/ba-p/2042082)
    * Update testing VERSION to [v5.6.15](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-5-6-15-Testing-has-been-released/ba-p/2042083)
    * Fix missing curl removal output redirect to /dev/null in Dockerfile
---
* **2017-08-23:**
    * Change README.md to add direct link to GitHub docker-compose.yml file
    * Change README.md to adjust formatting, replace tabs with spaces
---
* **2017-08-21:**
    * Update stable and unifi54 to use unifi-init script for startup/shutdown handling + SSL
    * Change README.md to reflect full SSL support across tags
    * Change README.md to reflect recommended --init flag for run to avoid possible signal handling issues
    * Change README.md to highlight host/Docker volume paths that need to be set/changed/removed.
    * Change docker-compose.yml to highlight host/Docker volume paths that need to be set/changed/removed
    * Update subfolders Makefile to use --init flag when 'make start' is used
---
* **2017-08-16:**
    * Changed UNIFI_VERSION to VERSION throughout
    * Where possible switched from 2 spaces to 4 spaces for indent, readability
    * Found extra used space to clean up in /var during build
    * Add clean process to Makefiles
    * Additional changes, cleanup and improvements to unifi-init script
---
* **2017-08-15:**
    * All UniFi versions remain unchanged.
    * Switch to curl for unifi_sysvinit_all.deb file retrieval. Not downloading whole directories, don't need wget functionality
    * Redirect apt-get/dpkg STDOUT noise during build to /dev/null. Makes finding errors during build much easier
    * Move UniFi version info into self-contained file `UNIFI_VERSION`. Makes Dockerfile totally tag/version independent
    * Updated Docker Hub hooks/build script to account for change. Loads UNIFI_VERSION file into a build arg
    * Switch to Makefiles for local builds. Automates injecting build args including UNIFI_VERSION
    * Update unifi54 branch to use same tools, build structure, labels, UNIFI_VERSION, etc.
    * Update uninfi54-sc to use unifi-init instead of supervisord
    * (doc) Move Changes from README.md to CHANGELOG.md. Added Markdown link in README.md to GitHub CHANGELOG.md blob
    * (doc) README.md other small updates
---
* **2017-08-13:**
    * All UniFi versions remain unchanged
    * Cleanup syntax, etc., collapse whitepace in unifi-init
    * Disable log tail in unifi-init. Need to find a better way to handle. For now app/db logs on container volume are sufficient
    * Further README.md updates
---
* **2017-08-12:**
    * All UniFi versions remain unchanged
    * Add build hook script and labels to Dockerfile
    * Switch base to `debain:jessie-slim` image to reduce overall size
    * Change unstable, testing, and sc tags to use bash init-script ENTRYPOINT instead of supervisord. Simplification and size reduction
    * Copy majority of function from UniFi packaged init-script. Change to JSVC for process launch
    * Add support for Java/JSVC environment variable adjustements at container start via --env command line flags
    * **Add SSL Java keystore update functionality**
    * Automated SSL cert import for LetsEncrypt, etc. if full cert chain and private key are present in PEM format
    * See "SSL custom certificate configuration support (LetsEncrypt, etc.)" further along in README.md
    * **Note:** Init-script changes will be moved to `latest` tag and the `unifi54` branch after a brief period to insure stability
    * Please report any bugs and/or issues on GitHub: https://github.com/goofball222/unifi
---
* **2017-08-09:** testing tag updated to UniFi 5.6.14
---
* **2017-08-08:** sc tag updated to UniFi 5.5.21
---
* **2017-07-31:** latest tag updated to UniFi 5.5.20, tagged release-5.5.20
---
* **2017-07-29:** lts and lts-sc tags changed to unifi54 and unifi54-sc
