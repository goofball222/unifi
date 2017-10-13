* **2017-10-12:**
    * Bump master:sc/VERSION to [5.6.19](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-5-6-19-Stable-Candidate-has-been-released/ba-p/2095589)
---
* **2017-10-10:**
    * Fix typo/spelling error in docker-entrypoint.sh
    * Update chown in docker-entrypoint.sh to use ${BASEDIR} instead of hardcoded path
---
* **2017-09-30:**
    * Bump master:stable/VERSION to [5.5.24](https://community.ubnt.com/t5/UniFi-Updates-Blog/UniFi-5-5-24-Stable-has-been-released/ba-p/2086518)
---
* **2017-09-30:**
    * Bump master:sc/VERSION to [5.6.18](https://community.ubnt.com/t5/UniFi-Updates-Blog/UniFi-5-6-18-Stable-Candidate-has-been-released/ba-p/2081597)
    * Update README.md
        * Change unifi55-sc VERSION [5.5.24](https://community.ubnt.com/t5/UniFi-Updates-Blog/UniFi-5-5-24-Stable-Candidate-has-been-released/ba-p/2082041) link to point to open release announcement
        * Update sc VERSION info
---
* **2017-09-25:**
    * Bump unifi55:sc/VERSION to [5.5.24](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-5-5-24-Stable-Candidate-has-been-released/ba-p/2076003)
    * Bump master:testing/VERSION to [5.6.18](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-5-6-18-Testing-has-been-released/ba-p/2076026)
    * Update README.md to document VERSION changes
---
* **2017-09-22:**
    * docker-entrypoint.sh changes:
        * Add support for running UniFi Java and Mongo processes as UID=0 (root) when explicitly requested, default to run as UID/GID=999 (unifi) for security
        * Add log function to replace the myriad of "echo $(date blah)" calls, tee output to append to UniFi server.log
        * Reintroduce exit signals trap and add exit_handler function to call UniFi .jar stop
        * Add idle_handler function to spawn sacrificial tail & wait process used in exit signals trap
        * Add logic to catch 'setcap' failure and exit with RUNAS_UID0 suggestion
        * Various additions, updates and changes to log message formatting
    * Dockerfile changes:
        * Add RUNAS_UID0 ENV setting, default to false
    * Update README.md to document RUNAS_UID0 environment variable
---
* **2017-09-21:**
    * docker-entrypoint.sh changes:
        * Add support for privileged port (<1024) binding, enabled via setting BIND_PRIV environment variable to 'true'
            * Uses debian:jessie-slim included setcap to grant cap_net_bind_service=+ep on java binary at each run.
    * Dockerfile changes:
        * Add BIND_PRIV ENV setting, default to false
        * Reorder file contents slightly
    * Update README.md to document BIND_PRIV environment variable
---
* **2017-09-18:**
    * docker-entrypoint.sh changes:
        * Add support for setting custom UID/GID via UNIFI_UID and UNIFI_GID enviroment variables
    * Dockerfile changes:
        * Add support for setting custom UID/GID via UNIFI_UID and UNIFI_GID enviroment variables
        * Move all hardcoded ENV settings to beginning of Dockerfile in a single layer
    * Update README.md to document UNIFI_UID and UNIFI_GID enviroment variables
---
* **2017-09-08:**
    * Create unifi55 branch allowing for v5.6.X stable candidates/stable and v5.5.X move to LTS
    * Move master/sc v5.5.23 to unifi55/sc
    * Update master/sc VERSION to [5.6.16](https://community.ubnt.com/t5/UniFi-Updates-Blog/UniFi-5-6-16-Stable-Candidate-has-been-released/ba-p/2056618)
    * Update Docker Hub settings to build from new unifi55 branch
    * Move docker-compose.yml to examples subfolder
    * Create docker-compose-EXTERNALDB.yml in examples subfolder
    * Switch container back to initially running as root/UID=0
        * Allows startup to insure permissions for directories and data are correct at each run
        * Can be overridden at startup via Docker --user command (IE: --user unifi)
    * Dockerfile changes:
        * Remove "USER unifi", handling process setuid/setgid with "gosu" instead of relying on Docker
        * Add ENV GOSU_VERSION variable
        * Add gosu download and setup in RUN
        * Add set +x to RUN to provide some minimal verbosity transparency into build steps
        * Move "&&" in RUN from end of commands to start of next line, format is cleaner
        * Change curl UniFi download to output to specific file in /tmp
        * Remove unused ENV JVM_MAX_THREAD_STACK_SIZE
        * Change ENTRYPOINT to point to "docker-entrypoint.sh"
        * Add CMD "unifi" as default action for entrypoint, makes it simpler to override container startup for maintenance, etc.
    * Move scripts and files to root subfolders matching finished container paths
    * Rename unifi-init to docker-entrypoint.sh, move to /usr/local/bin/
    * docker-entrypoint.sh changes:
        * Support Dockerfile ENTRYPOINT CMD passthrough
        * Remove JVM_MAX_THREAD_STACK_SIZE
        * Clean up other JVM ENV options processing
        * Add logic to check for script running as UID=0
            * Allows to adjust file/folder permissions, then setuid/setgid for final Java process to 999
            * Further supports commands to be passed through and run as root or other specified user
    * Rework README.md
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
