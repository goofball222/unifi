* **2017-08-15:**
    * All UniFi versions remain unchanged.
    * Switch to curl for unifi_sysvinit_all.deb file retrieval. Not downloading whole directories, don't need wget functionality.
    * Redirect apt-get/dpkg STDOUT noise during build to /dev/null. Makes finding errors during build much easier.
    * Move UniFi version info into self-contained file `UNIFI_VERSION`. Makes Dockerfile totally tag/version independent.
        * Updated Docker Hub hooks/build script to account for change. Loads UNIFI_VERSION file into a build arg.
    * Switch to Makefiles for local builds. Automates injecting build args including UNIFI_VERSION.
    * Update unifi54 branch to use same tools, build structure, labels, UNIFI_VERSION, etc.
    * Update uninfi54-sc to use unifi-init instead of supervisord.
    * (doc) Move Changes from README.md to CHANGELOG.md. Added Markdown link in README.md to GitHub CHANGELOG.md blob.
    * (doc) README.md other small updates.
---
* **2017-08-13:**
    * All UniFi versions remain unchanged.
    * Cleanup syntax, etc., collapse whitepace in unifi-init.
    * Disable log tail in unifi-init. Need to find a better way to handle. For now app/db logs on container volume are sufficient.
    * Further README.md updates.
---
* **2017-08-12:**
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
---
* **2017-08-09:** testing tag updated to UniFi 5.6.14
---
* **2017-08-08:** sc tag updated to UniFi 5.5.21
---
* **2017-07-31:** latest tag updated to UniFi 5.5.20, tagged release-5.5.20
---
* **2017-07-29:** lts and lts-sc tags changed to unifi54 and unifi54-sc
