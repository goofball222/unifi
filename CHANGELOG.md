* **2021-06-24:**
    * Create 6.3/beta, v[6.3.51](https://community.ui.com/releases/UniFi-Network-Application-6-3-51/af39cc49-d743-462f-978a-5707d217bb4f)
    * Update 6.2/official to v[6.2.26](https://community.ui.com/releases/UniFi-Network-Application-6-2-26/0dfcbc77-8a4f-4e20-bb93-07bbb0237e3a)
    * Tag 6.2.26 release
---
* **2021-06-17:**
    * Update GitHub actions
    * Update README.md
---
* **2021-06-16:**
    * **GitHub actions build allows multi-architecture platforms:**
    * Latest/default tag Debian Buster image: linux/amd64
    * Alpine image: linux/amd64, linux/arm64, linux/arm/v7
    * New Ubuntu image: linux/amd64, linux/arm64
    * Multi-architechture images rebuilt back to 5.14 (non-static/tagged builds).
    * Targeting switch from Debian as latest/default to Ubuntu in the near future if no [issues](https://github.com/goofball222/unifi/issues) reported with it. Please test!
    * Move everything older than 5.14 to archive folder
---
* **2021-06-15:**
    * Switch to using GitHub actions for builds
    * Update Dockerfiles for GitHub actions
    * Promote 6.2 official to "latest" and "latest-alpine" tags
    * Tag 6.2.25 release
---
* **2021-05-31:**
    * Update 6.2/beta to v[6.2.26](https://community.ui.com/releases/UniFi-Network-Application-6-2-26/4ce235f8-c479-477e-b71a-e66d5294c5a9)
---
* **2021-05-14:**
    * Update 6.2/official to v[6.2.25](https://community.ui.com/releases/UniFi-Network-Application-6-2-25/d9cb0897-3ef4-4dda-a5d6-c07530ff8a86)
---
* **2021-04-28:**
    * Update 6.2/beta to v[6.2.23](https://community.ui.com/releases/UniFi-Network-Application-6-2-23/55d0375e-86cd-4922-ad91-786a2e4b0bb5)
---
* **2021-04-16:**
    * Update 6.2/beta to v[6.2.19](https://community.ui.com/releases/UniFi-Network-Controller-6-2-19/23346096-9421-491a-9869-f8d94bde962a)
    * Copy 6.2/beta v[6.2.17](https://community.ui.com/releases/UniFi-Network-Controller-6-2-17/7f6d58bc-ce9f-43f2-8bc8-0c0dd935ebce) to 6.2/official
---
* **2021-04-12:**
    * Update 6.2/beta to v[6.2.17](https://community.ui.com/releases/UniFi-Network-Controller-6-2-17/ea1d097f-9990-48d0-be18-984352e3d5ed)
---
* **2021-04-02:**
    * Update 6.2/beta to v[6.2.13](https://community.ui.com/releases/UniFi-Network-Controller-6-2-13/f8dc5ebe-8790-4ae6-a7f7-6d1cc53e510f)
    * Promote 6.1 official to "latest" and "latest-alpine" tags
    * Tag 6.1.71 release
---
* **2021-03-25:**
    * Update 6.1/official to [6.1.71](https://community.ui.com/releases/UniFi-Network-Controller-6-1-71/0cffd3ed-7429-4529-9a20-9fead78ebf66)
    * Create 6.2/beta, version [6.2.12](https://community.ui.com/releases/UniFi-Network-Controller-6-2-12/41529bd2-d156-4731-b201-68c069d7bd00)
---
* **2021-03-23:**
    * Update 6.1/beta to [6.1.71](https://community.ui.com/releases/UniFi-Network-Controller-6-1-71/6755cdd6-17c9-4f46-875c-56fc7ed76d0d)
---
* **2021-03-17:**
    * Update 6.1/official to [6.1.70](https://community.ui.com/releases/UniFi-Network-Controller-6-1-70/f0607cc3-80dc-4019-87ad-02207b546417)
---
* **2021-03-15:**
    * Update 6.1/beta to [6.1.70](https://community.ui.com/releases/UniFi-Network-Controller-6-1-70/3e704dbd-932c-466a-98f8-191e944411d2)
---
* **2021-03-13:**
    * Update 6.1/beta to [6.1.69](https://community.ui.com/releases/UniFi-Network-Controller-6-1-69/f470cbc3-21af-4922-a5f7-5fe9746a958f)
    * Re-base beta Alpine images to pure Alpine, add gcompat and libc6-compat for compatibility, instead of using frolvlad/alpine-glibc:latest
---
* **2021-03-10:**
    * Update 6.1/official to [6.1.67](https://community.ui.com/releases/UniFi-Network-Controller-6-1-67/aed28c2f-6346-45b2-9f40-6eb92accafa8)
    * Change git master branch to main
    * Create 6.1/test and 6.1-alpine-test tag with base alpine + gcompat + libc6-compat as possible fix for [#81](https://github.com/goofball222/unifi/issues/81), evaluate moving from frolvlad/alpine-glibc
---
* **2021-03-08:**
    * Update 6.1/beta to [6.1.67](https://community.ui.com/releases/UniFi-Network-Controller-6-1-67/ac0256ea-c41a-4d4e-8141-c9f9f5b633e0)
    * Update 6.1/official to [6.1.65](https://community.ui.com/releases/UniFi-Network-Controller-6-1-65/fbfd6971-3da4-420a-9568-103047515e91)
---
* **2021-03-05:**
    * Update 6.1/beta to [6.1.65](https://community.ui.com/releases/UniFi-Network-Controller-6-1-65/75073c38-4001-4d86-be81-5c0ffc75af0d)
---
* **2021-03-04:**
    * Update 6.1/beta to [6.1.64](https://community.ui.com/releases/UniFi-Network-Controller-6-1-64/a8587fe2-e9b1-43a4-9f97-bcd5051226d6)
    * Clone 6.1/beta to 6.1/official
    * Set 6.1/official to [6.1.61](https://community.ui.com/releases/UniFi-Network-Controller-6-1-61/62f1ad38-1ac5-430c-94b0-becbb8f71d7d)
    * Promote 6.0 official to "latest" and "latest-alpine" tags
    * Update README.md to clean up old info and match latest changes
---
* **2021-02-26:**
    * Update 6.1/beta to [6.1.61](https://community.ui.com/releases/UniFi-Network-Controller-6-1-61/10f88932-c0fd-4852-a664-b697cb093db5)
---
* **2021-02-25:**
    * Update 6.1/beta to [6.1.60](https://community.ui.com/releases/UniFi-Network-Controller-6-1-60/cb517125-4df6-469b-a6ae-4e21f711977e)
---
* **2021-02-22:**
    * Update 6.1/beta to [6.1.57](https://community.ui.com/releases/UniFi-Network-Controller-6-1-57/e3a8ce82-da5d-44ce-83c2-1ff7e1a582ac)
---
* **2021-02-18:**
    * Update 6.1/beta to [6.1.56](https://community.ui.com/releases/UniFi-Network-Controller-6-1-56/cd377c0b-35ca-4bc7-85d4-bd14fe9da394)
---
* **2021-02-15:**
    * Update 6.1/beta to [6.1.55](https://community.ui.com/releases/UniFi-Network-Controller-6-1-55/6bf37c63-27ae-4739-8309-bfd432e17461)
---
* **2021-02-08:**
    * Update 6.1/beta to [6.1.54](https://community.ui.com/releases/UniFi-Network-Controller-6-1-54/f44aa98c-6714-408b-8900-5f125272fd17)
---
* **2021-01-28:**
    * Update 6.1/beta to [6.1.51](https://community.ui.com/releases/UniFi-Network-Controller-6-1-51/9124593a-1d5e-40f1-a3a7-ab62862e1fce)
---
* **2021-01-26:**
    * Update 6.0/official to [6.0.45](https://community.ui.com/releases/UniFi-Network-Controller-6-0-45/8d3b98e1-b9d4-4ab3-b8da-721dbe9ab842)
    * Tag 6.0.45 release
---
* **2021-01-25:**
    * Update 6.0/beta to [6.0.45](https://community.ui.com/releases/UniFi-Network-Controller-6-0-45/01f9f1fb-08f2-4573-bae1-c784df9b1818)
---
* **2021-01-05:**
    * Update 6.0/official to version [6.0.43](https://community.ui.com/releases/UniFi-Network-Controller-6-0-43/b28bb453-927a-4dd8-82f7-40af28505510)
    * Tag 6.0.43 release
---
* **2020-12-17:**
    * Update 6.0/beta to [6.0.43](https://community.ui.com/releases/UniFi-Network-Controller-6-0-43/b28bb453-927a-4dd8-82f7-40af28505510)
---
* **2020-12-08:**
    * Update 6.0/beta to [6.0.42](https://community.ui.com/releases/UniFi-Network-Controller-6-0-42/2fb39256-9c42-44d5-a6db-74a6436d1709)
---
* **2020-12-03:**
    * Update 6.0/beta to [6.0.41](https://community.ui.com/releases/UniFi-Network-Controller-6-0-41/688e2bee-63c9-4fcb-ba89-a1249566f5ae)
    * Update 6.0/official to version [6.0.41](https://community.ui.com/releases/UniFi-Network-Controller-6-0-41/25633411-0273-4197-bf30-4aff30b3701e)
    * Tag 6.0.41 release
---
* **2020-11-30:**
    * Update 6.0/beta to [6.0.40](https://community.ui.com/releases/UniFi-Network-Controller-6-0-40/6a6cd5a5-9210-43df-a259-0e3965140f35)
---
* **2020-11-19:**
    * Update 6.1/beta to [6.1.26](https://community.ui.com/releases/UniFi-Network-Controller-6-1-26/7e6fc39f-6784-4558-8fba-ea130886f915)
    * Update 6.0/beta to [6.0.37](https://community.ui.com/releases/UniFi-Network-Controller-6-0-37/60ac4406-fee8-4a73-959e-0289c7b465de)
    * Update 6.0/official to version [6.0.36](https://community.ui.com/releases/UniFi-Network-Controller-6-0-36/9e57165b-3422-4fcf-ae02-13affcb388c8)
    * Tag 6.0.36 release
---
* **2020-11-06:**
    * Update 6.1/beta to [6.1.25](https://community.ui.com/releases/UniFi-Network-Controller-6-1-25/4b82a131-0237-4bf0-b6a0-aea14aac25fe)
---
* **2020-11-04:**
    * Update 6.0/beta to [6.0.34](https://community.ui.com/releases/UniFi-Network-Controller-6-0-34/5abb40a8-d765-4e92-ba6b-032f54ebea75)
---
* **2020-11-03:**
    * Update 6.1/beta to [6.1.23](https://community.ui.com/releases/UniFi-Network-Controller-6-1-23/1d35112c-4040-4fe5-b049-fc71d86ae962)
---
* **2020-10-30:**
    * Update 6.0/beta to [6.0.33](https://community.ui.com/releases/UniFi-Network-Controller-6-0-33/6dc29308-b5b0-439b-bfde-a0ac6b08cc93)
---
* **2020-10-28:**
    * Update 6.1/beta to [6.1.21](https://community.ui.com/releases/UniFi-Network-Controller-6-1-21/f11067bc-46b7-4eeb-a29c-e2687598f12f)
---
* **2020-10-25:**
    * Rework directory and tag structure to match UI community beta/official designations (no more unstable/testing/sc/stable)
    * Update 6.0/beta to [6.0.31](https://community.ui.com/releases/UniFi-Network-Controller-6-0-31/e63ccd8b-d382-484f-a0bd-6ee45f965625)
---
* **2020-10-22:**
    * Update 6.0/sc to version [6.0.29](https://community.ui.com/releases/UniFi-Network-Controller-6-0-29/c68004ca-ecc4-45c2-b267-4b5fbcaa9751)
---
* **2020-10-20:**
    * Promote version [6.0.28](https://community.ui.com/releases/UniFi-Network-Controller-6-0-28/23c77a99-0957-449a-b3c0-58a37d4df81f) to 6.0/stable
    * Update 6.0/sc to version [6.0.28](https://community.ui.com/releases/UniFi-Network-Controller-6-0-28/cf0fe647-8623-4cb4-a257-f985da68f7e3)
    * Update 6.1/testing to version [6.1.20](https://community.ui.com/releases/UniFi-Network-Controller-6-1-20/56c5fccf-4018-4b89-9337-33aa621b7daf)
    * Tag 6.0.28 release
---
* **2020-10-09:**
    * Update 6.0/sc to version [6.0.27](https://community.ui.com/releases/UniFi-Network-Controller-6-0-27/452aa4a3-c108-4a04-8c05-242371c27d93)
---
* **2020-10-05:**
    * Update 6.0/sc to version [6.0.26](https://community.ui.com/releases/UniFi-Network-Controller-6-0-26/4d5d550d-8b4b-4387-ba14-e8065872dca5)
---
* **2020-09-30:**
    * Create 6.1/testing, version [6.1.16](https://community.ui.com/releases/UniFi-Network-Controller-6-1-16/fb0a369e-1fdd-488e-95d1-6d4f5f236585)
---
* **2020-09-23:**
    * Promote version [6.0.23](https://community.ui.com/releases/UniFi-Network-Controller-6-0-23/6ee72622-e3ca-4ebe-9e82-97fe7cca2094) to stable but not tagging as Docker latest due to a plethora of issues with 6.0
    * Update 6.0/sc to version [6.0.24](https://community.ui.com/releases/UniFi-Network-Controller-6-0-24/d897a089-4f1d-4fc5-ab5a-0d9f034f91fd)
    * Tag 6.0.23 release
---
* **2020-09-18:**
    * Promote version [6.0.22](https://community.ui.com/releases/UniFi-Network-Controller-6-0-22/910ceffc-f0e9-4518-86c1-df5eeee34695) to stable but not tagging as Docker latest due to a plethora of issues with 6.0
    * Update 6.0/sc to version [6.0.23](https://community.ui.com/releases/UniFi-Network-Controller-6-0-23/97c4c8cd-e330-4e24-a6ba-0e4aa028cbeb)
    * Tag 6.0.22 release
---
* **2020-09-16:**
    * Update 6.0/sc to version [6.0.22](https://community.ui.com/releases/UniFi-Network-Controller-6-0-22/910ceffc-f0e9-4518-86c1-df5eeee34695)
    * Promote version [6.0.20](https://community.ui.com/releases/UniFi-Network-Controller-6-0-20/3ddd1684-6747-4a66-a038-5ff0b25f4027) to stable but not tagging as Docker latest due to a plethora of issues
    * Tag 6.0.20 release
---
* **2020-09-11:**
    * Update 6.0/sc to version [6.0.20](https://community.ui.com/releases/UniFi-Network-Controller-6-0-20/c31c23b3-327f-488d-ba9a-28af0d4d33bb)
---
* **2020-09-09:**
    * Update 6.0/sc to version [6.0.19](https://community.ui.com/releases/UniFi-Network-Controller-6-0-19/347b4ed7-70bd-4e77-9287-b2aea01b1857)
---
* **2020-09-03:**
    * Update 6.0/sc to version [6.0.18](https://community.ui.com/releases/UniFi-Network-Controller-6-0-18/5869a608-5e12-4df8-ab1b-674a906d996d)
---
* **2020-08-25:**
    * Move 5.14/sc to stable version [5.14.23](https://community.ui.com/releases/UniFi-Network-Controller-5-14-23/daf90732-30ad-48ee-81e7-1dcb374eba2a)
    * Tag 5.14.23 release
---
* **2020-08-24:**
    * Update 6.0/sc to version [6.0.15](https://community.ui.com/releases/UniFi-Network-Controller-6-0-15/2f3b838f-023d-4e5d-bd2a-522f9a0fa1dc)
    * Update 5.14/sc to version [5.14.23](https://community.ui.com/releases/UniFi-Network-Controller-5-14-23/f8d1a0d8-5b65-46f7-8ce1-d1d9eabe2eb2)
---
* **2020-08-20:**
    * Move 5.14/sc to stable version [5.14.22](https://community.ui.com/releases/UniFi-Network-Controller-5-14-22/65337b17-f6e4-4f91-b78e-a4db05826e41)
    * Tag 5.14.22 release
---
* **2020-08-13:**
    * Update 6.0/sc to version [6.0.13](https://community.ui.com/releases/UniFi-Network-Controller-6-0-13/6fb0632c-0290-4800-8d9e-90cd7ca1dfe4)
---
* **2020-08-11:**
    * Update 6.0/sc to version [6.0.12](https://community.ui.com/releases/UniFi-Network-Controller-6-0-12/ca072416-1668-47d8-9726-2abb19385315)
---
* **2020-08-07:**
    * Update 5.14/sc to version [5.14.22](https://community.ui.com/releases/UniFi-Network-Controller-5-14-22/bdc5bf2c-5bbc-42f5-9bec-3e63e9231647)
---
* **2020-08-05:**
    * Add libcap2-bin to Debian:buster-slim images. Fixes #68
---
* **2020-08-03:**
    * Move 5.14/testing to sc, version [5.14.20](https://community.ui.com/releases/UniFi-Network-Controller-5-14-20/a232c73f-f525-418e-bf1a-fd206ce94a76)
---
* **2020-07-31:**
    * Move 6.0/unstable to sc, version [6.0.8](https://community.ui.com/releases/UniFi-Network-Controller-6-0-8/369d3499-484a-42d2-9b75-1419e38bc32d)
---
* **2020-07-15:**
    * Update 6.0/unstable to version [6.0.4](https://community.ui.com/releases/UniFi-Network-Controller-6-0-4/56057601-966c-4777-bdfd-2dc667da1154)
---
* **2020-07-09:**
    * Update Debian Dockerfiles for 5.13+ to use Mongo 3.6
---
* **2020-07-07:**
    * Create 6.0/unstable, version [6.0.3](https://community.ui.com/releases/UniFi-Network-Controller-6-0-3/06e1278b-7aa1-4f0e-a4e3-3ff947a7f2b3)
    * Update Dockerfile label schema
---
* **2020-07-03:**
    * Update 5.14/testing to version [5.14.17](https://community.ui.com/releases/UniFi-Network-Controller-5-14-17/35321135-e0b0-4d07-8f4c-144a504c77f8)
---
* **2020-07-02:**
    * Move 5.13/sc to 5.13/stable, still version [5.13.32](https://community.ui.com/releases/UniFi-Network-Controller-5-13-32/85eee834-c987-4875-8de2-51c6842d7bd3)
    * Tag 5.13.32 release
---
* **2020-06-23:**
    * Update 5.14/testing to version [5.14.15](https://community.ui.com/releases/UniFi-Network-Controller-5-14-15/7c52416b-578c-4b4f-947c-13f322feded7)
---
* **2020-06-22:**
    * Fix for OpenJDK-11 being pulled in by ca-certificates-java on Debian:buster-slim
---
* **2020-06-16:**
    * Update 5.13/sc to version [5.13.32](https://community.ui.com/releases/UniFi-Network-Controller-5-13-32/44d52317-0b29-43f9-a7f3-ccb52d98fa00)
---
* **2020-06-11:**
    * Move 5.13/sc to 5.13/stable, still version [5.13.29](https://community.ui.com/releases/UniFi-Network-Controller-5-13-29/d7647910-77a2-4e61-bbfe-389206f2d6ad)
    * Tag 5.13.29 release
---
* **2020-05-27:**
    * Update 5.14/testing to version [5.14.9](https://community.ui.com/releases/UniFi-Network-Controller-5-14-9/3451a314-04c8-459a-9ae2-77cac01c0c1f)
    * Update 5.13/sc to version [5.13.29](https://community.ui.com/releases/UniFi-Network-Controller-5-13-29/b40cbec0-251f-41e9-a765-b5fd8a65298d)
---
* **2020-05-19:**
    * Move 5.13/testing to 5.13/sc, still version [5.13.27](https://community.ui.com/releases/UniFi-Network-Controller-5-13-27/20946ec7-1905-44f7-8d2a-1a518ebf756a)
    * Add 5.14/testing, version [5.14.7](https://community.ui.com/releases/UniFi-Network-Controller-5-14-7/7e5dceb0-cab7-4a12-a5a9-23a997f8c6d8)
---
* **2020-05-18:**
    * Promote 5.12/sc to stable, version [5.12.72](https://community.ui.com/releases/UniFi-Network-Controller-5-12-72/9ac72983-5130-4f58-b3ba-909f4d4bb5f9)
    * Tag 5.12.72 release
---
* **2020-05-18:**
    * Update 5.13/testing to version [5.13.27](https://community.ui.com/releases/UniFi-Network-Controller-5-13-27/20946ec7-1905-44f7-8d2a-1a518ebf756a)
---
* **2020-05-13:**
    * Update 5.13/testing to version [5.13.26](https://community.ui.com/releases/UniFi-Network-Controller-5-13-26/eeb7e876-e13c-42e5-ba84-9bf74d6b76be)
---
* **2020-05-13:**
    * Move 5.12/testing to 5.12/sc, still version [5.12.72](https://community.ui.com/releases/UniFi-Network-Controller-5-12-72/9ac72983-5130-4f58-b3ba-909f4d4bb5f9)
---
* **2020-05-12:**
    * Clone 5.12/stable to 5.12/testing version [5.12.72](https://community.ui.com/releases/UniFi-Network-Controller-5-12-72/7366a375-fef7-44de-b8fb-d4d7e0fadc93)
---
* **2020-05-06:**
    * Update 5.13/testing to version [5.13.22](https://community.ui.com/releases/UniFi-Network-Controller-5-13-22/c1518819-aa29-4a16-a7b0-f799119c48de)
---
* **2020-04-21:**
    * Update 5.13/testing to version [5.13.18](https://community.ui.com/releases/UniFi-Network-Controller-5-13-18/4d8fe2de-f011-4c81-a56b-9af06a0266a4)
---
* **2020-03-23:**
    * Promote 5.12/sc to stable, version [5.12.66](https://community.ui.com/releases/UniFi-Network-Controller-5-12-66/ac49e57b-6f38-4912-8455-940d3d487d00)
    * Tag 5.12.66 release
---
* **2020-03-07:**
    * Update 5.13/testing to version [5.13.10](https://community.ui.com/releases/UniFi-Network-Controller-5-13-10/345bd4ae-aafc-435d-bd92-0cb3048d38e9)
---
* **2020-02-25:**
    * Update 5.12/sc to version [5.12.66](https://community.ui.com/releases/UniFi-Network-Controller-5-12-66/7c67dfd6-251c-4992-9f35-7d3a9035c406)
---
* **2020-02-10:**
    * Move 5.12/testing to 5.12/sc, update to version [5.12.60](https://community.ui.com/releases/UniFi-Network-Controller-5-12-60/3a8b7df2-fa35-4d5f-aee9-d07b7a61cdc2)
---
* **2020-01-20:**
    * Clone 5.12/testing to 5.13/testing version [5.13.9](https://community.ui.com/releases/UniFi-Network-Controller-5-13-9/ccabebdd-503e-46c8-a4aa-79a2fa654326)
---
* **2019-12-20:**
    * Update 5.12/testing to version [5.12.46](https://community.ui.com/releases/UniFi-Network-Controller-5-12-46/de5a2124-3012-4704-ab4e-ea2d227f0e6e)
---
* **2019-12-06:**
    * Update 5.12/testing/Dockerfile.debian* to use debian:buster-slim as the base image
        * Plan to move this change out to 5.12/stable and all current images at next UniFi release, barring any issues reported
    * All: add docker-healthcheck.sh to provide health status of UniFi web server to Docker host
---
* **2019-11-26:**
    * Update 5.12/testing to version [5.12.42](https://community.ui.com/releases/UniFi-Network-Controller-5-12-42/1ef1387d-02bc-4d5c-a1f1-f7d21952adc6)
---
* **2019-11-22:**
    * Promote 5.12/sc to stable, version [5.12.35](https://community.ui.com/releases/UniFi-Network-Controller-5-12-35/45726736-ee4c-4172-877a-a2303f5d3627)
    * Tag 5.12.35 release
---
* **2019-11-20:**
    * Update 5.12/testing to version [5.12.37](https://community.ui.com/releases/UniFi-Network-Controller-5-12-37/4cb72b3c-32bd-45eb-b524-c8398ed35b42)
---
* **2019-11-18:**
    * Update 5.12/sc to version [5.12.35](https://community.ui.com/releases/UniFi-Network-Controller-5-12-35/d547b15d-25da-4087-a371-91be061fc6a3)
---
* **2019-11-14:**
    * Update 5.12/sc to version [5.12.31](https://community.ui.com/releases/UniFi-Network-Controller-5-12-31/9ac72482-93ef-4dd9-9ca2-f9a4fd8886d5)
---
* **2019-10-31:**
    * Move 5.12/sc to stable, version [5.12.22](https://community.ui.com/releases/UniFi-Network-Controller-5-12-22/263c8b60-def8-4667-85c3-87a6200a6c9b)
---
* **2019-10-24:**
    * Move 5.12/testing to sc, version [5.12.22](https://community.ui.com/releases/UniFi-Network-Controller-5-12-22/263c8b60-def8-4667-85c3-87a6200a6c9b)
---
* **2019-10-23:**
    * Create 5.12/testing, version [5.12.22](https://community.ui.com/releases/UniFi-Network-Controller-5-12-22/0980b7e2-802e-4aba-9f7e-d075ad733265)
---
* **2019-10-18:**
    * Update 5.12/sc to version [5.12.19](https://community.ui.com/releases/UniFi-Network-Controller-5-12-19/c21cb9e4-1c7a-41f1-87f6-618933da4c5b)
---
* **2019-10-16:**
    * Move 5.12/testing to 5.12/sc, still version [5.12.16](https://community.ui.com/releases/UniFi-Network-Controller-5-12-16/50031836-435f-4561-9150-a149007dd85c)
---
* **2019-10-09:**
    * Update 5.12/testing to version [5.12.16](https://community.ui.com/releases/UniFi-Network-Controller-5-12-16/f0b91760-bdc6-4dc5-bad4-c413f96e8b13)
---
* **2019-10-09:**
    * Update 5.12/testing to version [5.12.13](https://community.ui.com/releases/UniFi-Network-Controller-5-12-13/a84fdeb3-3f5f-4507-9387-901842f253aa)
    * Update 5.11/sc to version [5.11.52](https://community.ui.com/releases/UniFi-Network-Controller-5-11-52/19d0c081-14ba-498e-95ac-6d6654b9bba5)
---
* **2019-10-08:**
    * Promote 5.11.50 from sc to [stable](https://community.ui.com/releases/UniFi-Network-Controller-5-11-50/1728a1f1-f0a8-45dd-a2e2-95abcfc50dab)
    * Tag 5.11.50 release
---
* **2019-10-01:**
    * Promote 5.11/sc to [stable](https://community.ui.com/releases/UniFi-Network-Controller-5-11-47/bc6b27a7-ada4-4cb5-a162-c659ed755a9f)
    * Tag 5.11.47 release
---
* **2019-09-30:**
    * Update 5.12/testing to version [5.12.11](https://community.ui.com/releases/UniFi-Network-Controller-5-12-11/20c6a8db-0544-4125-86e1-de0b227e4799)
    * Update 5.11/sc to version [5.11.50](https://community.ui.com/releases/UniFi-Network-Controller-5-11-50/61df12d7-bd3c-426f-8aa3-b155adc45d8f)
---
* **2019-09-26:**
    * Update 5.11/sc to version [5.11.48](https://community.ui.com/releases/UniFi-Network-Controller-5-11-48/f6fcf0c9-3f17-434c-b4d6-7c36d5518f84)
---
* **2019-09-19:**
    * Update 5.11/sc to version [5.11.47](https://community.ui.com/releases/UniFi-Network-Controller-5-11-47/2b1460ee-fe2b-426e-a9fd-752b6baae81e)
---
* **2019-08-24:**
    * Promote 5.11/sc to [stable](https://community.ui.com/releases/UniFi-Network-Controller-5-11-46/1984aaf0-7243-4257-af83-70126714613e)
    * Tag 5.11.46 release
---
* **2019-09-11:**
    * Update 5.11/sc to version [5.11.46](https://community.ui.com/releases/UniFi-Network-Controller-5-11-46/1984aaf0-7243-4257-af83-70126714613e)
---
* **2019-09-10:**
    * Create 5.12/unstable, version [5.12.5](https://community.ui.com/releases/UniFi-Network-Controller-5-12-5/6e656b4e-5406-44c3-a56c-a4637ae7a6b3)
---
* **2019-09-04:**
    * Update 5.11/sc to version [5.11.45](https://community.ui.com/releases/UniFi-Network-Controller-5-11-45/fc758129-7b75-44e8-8da2-1150e7359f7d)
---
* **2019-08-30:**
    * Update 5.10/stable to version [5.10.27](https://community.ui.com/releases/UniFi-Network-Controller-5-10-27/c80933a1-e240-4b54-9923-75a4e95142fd)
    * Tag 5.10.27 release
        * Missed this release being promoted to stable on 2019-08-20. UI community release alerts don't work if they just change the designation on an existing post... *sigh*
---
* **2019-08-24:**
    * Promote 5.11/sc to [stable](https://community.ui.com/releases/UniFi-Network-Controller-5-11-39/6ab8ef1a-376f-41e6-85b2-ceec098b8462)
    * Tag 5.11.39 release
---
* **2019-08-09:**
    * Update 5.11/sc to version [5.11.39](https://community.ui.com/releases/UniFi-Network-Controller-5-11-39/4872e0a9-8020-44e9-bdbf-3999565ad35e)
    * Update Docker tagging, add version tags that track latest UI development point release/stable, drop -debian-nomongo from autobuilds and tag table.
---
* **2019-08-09:**
    * Update 5.11/sc to version [5.11.38](https://community.ui.com/releases/UniFi-Network-Controller-5-11-38/5130ef57-1127-4c69-b20c-1cc823f1be3b)
    * Update all hooks/build scripts to support multi-tag image builds on Docker Cloud
---
* **2019-08-08:**
    * Update 5.10/stable to version [5.10.26](https://community.ui.com/releases/UniFi-Network-Controller-5-10-26/2bcd1137-a5f1-437b-ba5d-30f9be2049c1)
    * Tag 5.10.26 release
        * Missed this release being published on 2019-07-30. New UI community added e-mail alert functionality for releases again so we'll see...
---
* **2019-08-06:**
    * Update 5.10/sc to version [5.10.27](https://community.ui.com/releases/UniFi-Network-Controller-5-10-27/7eb576ae-0a4e-4b37-9d73-82ec47d7902d)
    * Fix regression to 5.11.34 in 5.11/testing/VERSION
---
* **2019-07-31:**
    * Update 5.11/testing to version [5.11.36](https://community.ui.com/releases/UniFi-Network-Controller-5-11-36/a888e5ed-be25-4b81-8949-a677f9e09f3d)
---
* **2019-07-23:**
    * Update 5.11/testing to version [5.11.34](https://community.ui.com/releases/UniFi-Network-Controller-5-11-34/d0aead68-714b-4802-a984-ed65adbd6a50)
---
* **2019-07-18:**
    * Update 5.10/sc to version [5.10.26](https://community.ui.com/releases/UniFi-Network-Controller-5-10-26/6f393935-a023-4855-b9ec-f38b5a12d610)
---
* **2019-06-25:**
    * Update 5.11/testing to version [5.11.31](https://community.ui.com/releases/UniFi-Network-Controller-5-11-31/c7f8a8a0-0414-4324-a567-1f2b3cb6affa)
    * Update Dockerfile package download links to point to new https://dl.ui.com instead of https://dl.ubnt.com
---
* **2019-06-20:**
    * Update 5.10/stable to version [5.10.25](https://community.ui.com/releases/UniFi-Network-Controller-Stable-5-10-25/fc76945d-c918-4d8d-8cd1-094d05287f45)
    * Tag 5.10.25 release
    * New UBNT "community" software **S U C K S**
---
* **2019-06-08:**
    * Update 5.10/sc to version [5.10.25](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-Network-Controller-5-10-25-Stable-Candidate-has-been/ba-p/2809319)
---
* **2019-06-07:**
    * Update 5.11/testing to version [5.11.29](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-Network-Controller-5-11-29-Testing-has-been-released/ba-p/2809129)
---
* **2019-06-04:**
    * Update 5.10/stable to version [5.10.24](https://community.ubnt.com/t5/UniFi-Updates-Blog/UniFi-Network-Controller-5-10-24-Stable-has-been-released/ba-p/2790242)
    * Tag 5.10.24 release
---
* **2019-05-25:**
    * Update 5.11/unstable to version [5.11.26](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-Network-Controller-5-11-26-Unstable-has-been-released/ba-p/2794468)
---
* **2019-05-20:**
    * Update 5.10/sc to version [5.10.24](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-Network-Controller-5-10-24-Stable-Candidate-has-been/ba-p/2789167)
---
* **2019-05-03:**
    * Update 5.10/stable to version [5.10.23](https://community.ubnt.com/t5/UniFi-Updates-Blog/UniFi-Network-Controller-5-10-23-Stable-has-been-released/ba-p/2771305)
    * Tag 5.10.23 release
    * Tag 5.6.42 release - https://community.ubnt.com/t5/UniFi-Updates-Blog/UniFi-Network-Controller-5-6-42-Stable-has-been-released/ba-p/2771271
---
* **2019-04-27:**
    * Update 5.10/sc to version [5.10.23](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-Network-Controller-5-10-23-Stable-Candidate-has-been/ba-p/2763414)
---
* **2019-04-23:**
    * Update 5.11/unstable to version [5.11.18](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-Network-Controller-5-11-18-Unstable-has-been-released/ba-p/2759716)
    * Update 5.10/sc to version [5.10.22](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-Network-Controller-5-10-22-Stable-Candidate-has-been/ba-p/2758357)
---
* **2019-04-11:**
    * OpenJDK upstream fixed deps, remove explicit nss package install from Alpine build, closes issue #33
---
* **2019-04-05:**
    * Update 5.10/stable to version [5.10.21](https://community.ubnt.com/t5/UniFi-Updates-Blog/UniFi-Network-Controller-5-10-21-Stable-has-been-released/ba-p/2741854)
    * Tag 5.10.21 release
---
* **2019-03-29:**
    * Update 5.10/sc to version [5.10.21](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-Network-Controller-5-10-21-Stable-Candidate-has-been/ba-p/2734156)
---
* **2019-03-27:**
    * Clone 5.10/stable to 5.11/unstable, update 5.11/unstable VERSION to [5.11.10](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-Network-Controller-5-11-10-Unstable-has-been-released/ba-p/2731721)
    * Fix jessie-backports apt repository to use archive - https://lists.debian.org/debian-devel-announce/2019/03/msg00006.html
        * Set apt-get update to ignore expired jessie-backports InRelease file - `apt-get -o Acquire::Check-Valid-Until=false -qqy update`
    * Force re-add nss package to Alpine build, fixes issue #33
    * Clean up 5.6, 5.8, and 5.9. UniFi development appears to be focused on 5.10 and 5.11. Can recreate for bug/security fixes as needed.
---
* **2019-03-12:**
    * Update 5.10/stable to version [5.10.20](https://community.ubnt.com/t5/UniFi-Updates-Blog/UniFi-Network-Controller-5-10-20-Stable-has-been-released/ba-p/2713745)
    * Tag 5.10.20 release
---
* **2019-03-07:**
    * Update 5.10/sc to version [5.10.20](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-Network-Controller-5-10-20-Stable-Candidate-has-been/ba-p/2707978)
---
* **2019-02-26:**
    * Update 5.10/stable to version [5.10.19](https://community.ubnt.com/t5/UniFi-Updates-Blog/UniFi-Network-Controller-5-10-19-Stable-has-been-released/ba-p/2695209)
    * Tag 5.10.19 release
---
* **2019-02-15:**
    * Update 5.10/sc to version [5.10.19](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-Network-Controller-5-10-19-Stable-Candidate-has-been/ba-p/2680361)
---
* **2019-02-13:**
    * Update 5.10/stable to version [5.10.17](https://community.ubnt.com/t5/UniFi-Updates-Blog/UniFi-Network-Controller-5-10-17-Stable-has-been-released/ba-p/2676018)
    * Tag 5.10.17 release
---
* **2019-02-12:**
    * ~~Update 5.10/sc to version [5.10.15](https://community.ubnt.com/t5/UniFi-Updates-Blog/UniFi-Network-Controller-5-10-15-Stable-Candidate-has-been/ba-p/2674019)~~
    * Update 5.10/sc to version [5.10.16](https://community.ubnt.com/t5/UniFi-Updates-Blog/UniFi-Network-Controller-5-10-16-Stable-Candidate-has-been/ba-p/2674811)
---
* **2019-02-06:**
    * Promote 5.10/sc to 5.10/stable for stable release [5.10.12](https://community.ubnt.com/t5/UniFi-Updates-Blog/UniFi-Network-Controller-5-10-12-Stable-has-been-released/ba-p/2665341)
    * Tag 5.10.12 release
---
* **2019-02-05:**
    * Adjust README.md formatting to fix Docker Cloud/Hub rendering errors
---
* **2019-02-04:**
    * Update 5.10/sc to version [5.10.12](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-Network-Controller-5-10-12-Stable-Candidate-has-been/ba-p/2661477)
---
* **2019-01-29:**
    * Update 5.10/sc to version [5.10.11](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-Network-Controller-5-10-11-Stable-Candidate-has-been/ba-p/2654117)
---
* **2019-01-26:**
    * Clone 5.10/unstable to 5.10/sc, update 5.10/sc VERSION to [5.10.10](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-Network-Controller-5-10-10-Stable-Candidate-has-been/ba-p/2649077)
    * Update */root/usr/local/bin/entrypoint-functions.sh and docker-entrypoint.sh to 1.0.7
        * Always chown on ${LOGDIR}/*.log and ${DATADIR}/system.properties when RUN_CHOWN=false. Fixes permission errors during clean OOB non-root startup with no existing data/dirs.
---
* **2019-01-10:**
    * Clone 5.9/stable to 5.10/unstable, update 5.10/unstable VERSION to [5.10.5](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-Network-Controller-5-10-5-beta-has-been-released/ba-p/2627904)
---
* **2018-11-06:**
    * Clone 5.9/stable to 5.9/sc, update 5.9/sc VERSION to [5.9.32](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-SDN-Controller-5-9-32-Stable-Candidate-has-been-released/ba-p/2555555)
---
* **2018-10-04:**
    * Move 5.9/sc to 5.9/stable, version [5.9.29](https://community.ubnt.com/t5/UniFi-Updates-Blog/UniFi-SDN-Controller-5-9-29-Stable-has-been-released/ba-p/2516852) is now released as stable.
    * Tag 5.9.29 release
---
* **2018-09-25:**
    * Update 5.9/sc to version [5.9.29](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-SDN-Controller-5-9-29-Stable-Candidate-has-been-released/ba-p/2506740)
---
* **2018-09-11:**
    * Update 5.8/stable to version [5.8.30](https://community.ubnt.com/t5/UniFi-Updates-Blog/UniFi-SDN-Controller-5-8-30-Stable-has-been-released/ba-p/2489957)
    * Tag 5.8.30 release
    * Update 5.9/sc to version [5.9.26](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-SDN-Controller-5-9-26-Stable-Candidate-has-been-released/ba-p/2489657)
---
* **2018-09-10:**
    * Update 5.6/stable to version [5.6.40](https://community.ubnt.com/t5/UniFi-Updates-Blog/UniFi-SDN-Controller-5-6-40-LTS-Stable-has-been-released/ba-p/2488202)
    * Tag 5.6.40 release
    * Update 5.8/sc to version [5.8.30](https://community.ubnt.com/t5/UniFi-Updates-Blog/UniFi-SDN-Controller-5-8-30-Stable-Candidate-has-been-released/ba-p/2488240)
---
* **2018-09-04:**
    * Add stable candidate [5.8.28](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-SDN-Controller-5-8-29-Stable-Candidate-has-been-released/ba-p/2481622)
    * Add LTS stable candidate [5.6.40](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-5-6-40-LTS-Stable-Candidate-has-been-released/ba-p/2481272)
---
* **2018-08-24:**
    * Combine and move scripts/* back to root/usr/local/bin/docker-entrypoint.sh, now has OS/MODs independence
    * Functionize a lot of docker-entrypoint.sh and move it to root/usr/local/bin/entrypoint-functions.sh
    * Move defaults/system.properties.default back to root/usr/lib/unifi/system.properties.default
    * Update Dockerfiles for the entrypoint script changes
    * Update Alpine containers to add tzdata package. Setting timezone actually works now.
---
* **2018-08-22:**
    * Update scripts/*.sh to version 0.6.5, fix for issue #24 - allow setting custom GID/UID when already exists.
---
* **2018-08-21:**
    * Update scripts/*.sh to version 0.6.3, adjust wording on MongoDB WARN/ERROR
---
* **2018-08-21:**
    * Flatten git branches to master branch MAJOR.MINOR version subfolders.
        * IE: /5.6/stable, /5.8/{stable,sc}, /5.9/{sc,testing}, etc.
        * Docker cloud automated builds support subfolders and alternate Dockerfile paths allowing for this change.
    * Reorganize directory structure to support multiple Dockerfiles and entrypoint scripts per PATCH version.
        * Build container with different OSes, etc. easier
        * Move root/usr/lib/unifi/system.properties.default to defaults/system.properties.default
        * Move root/usr/local/bin/docker-entrypoint.sh scripts to scripts/{OS}-entrypoint{-MODS}.sh
        * Rename Dockerfile names to indicate/separate what OS+MODs they're based on.
        * ~~Move Dockerfile(s) to dockerfiles/Dockerfile.{OS}{.MOD}~~
    * Update scripts/{OS}-entrypoint{-MODS}.sh to version 0.6.2, insure each is tagged with expected OS+MODs 
        * IE: 0.6.2-alpine, 0.6.2-alpine-mongo, 0.6.2-debian, 0.6.2-debian-nomongo
    * Update Dockerfiles to drop COPY root / and use COPY statements specific to container OS+MODs
    * Update automatic build hooks script to include $DOCKERFILE_PATH variable to fix auto-build issues
    * Rename alpine-sc tag to sc-alpine. Future tags will always be 'releasetype-os-mods'
        * IE: sc-alpine = latest/most current UniFi Stable Candidate on Alpine; unifi58-alpine, sc-nomongo
    * Extend *-nom tags to *-nomongo to hopefully better clarify what they are.
    * Update README.md for the changes listed above.
---
* **2018-08-20:**
    * Update Alpine Dockerfile to include openssl package. Missing tools for certificate management without...
---
* **2018-08-17:**
    * Update Alpine Dockerfile to use 'frolvlad/alpine-glibc:latest' as source image.
        * Fixes musl-c vs. glibc compat issues with UniFi included Snappy library, probably others.
    * Update Alpine Dockerfile to leave curl installed, add other dependencies based on listing from Debian package.
    * Update Debian Dockerfiles to stop clearing dpkg and apt DBs. Only saving ~5MB of data doing so and causing headaches for users troubleshooting.
---
* **2018-08-13:**
    * Add experimental Alpine based builds running the v5.9.22 stable candidate. Hoping for smaller, simpler images.
        * alpine:sc - DOES NOT CONTAIN MONGO. Needs to be run via docker-compose and/or connected to external Mongo DB.
        * alpine:sc-mongo - More standard build containing Mongo DB binaries. Likely won't be used beyond here.
        * Known issue: WebRTC doesn't load. NOTE: Access to the controller from the UBNT Cloud portal doesn't work without this.
    * Add master:sc-nom - Debian image - DOES NOT CONTAIN MONGO. Should be run via docker-compose in tandem with external MongoDB.
    * Add unifi58:stable-nom - Debian image - DOES NOT CONTAIN MONGO. Should be run via docker-compose in tandem with external MongoDB.
    * Add unifi56:stable-nom - Debian image - DOES NOT CONTAIN MONGO. Should be run via docker-compose in tandem with external MongoDB.
    * Update Dockerfiles across the board with the following:
        * Remove MONGO_UID/MONGO_GID. The internal Mongo process runs as the "unifi" user anyway, so these aren't needed.
        * Change UNIFI_UID to PUID and UNIFI_GID to PGID.
        * Add RUN_CHOWN env entry and default it to 'true'. Make sure your permissions are correct and then set to 'false' to improve container startup times.
        * Switch gosu to the Debian package. The older direct-download method was prone to build failures due to unavailable keyservers.
    * Update docker-entrypoint.sh across the board to 0.6.1-debian.
        * Add automated UNIFI_GID and UNIFI_UID conversion to new PGID/PUID variables.
        * Add support for RUN_CHOWN env entry to skip chown command on slow overlay2 systems.
        * Add warnings about future change to remove internal Mongo from images if external DB variables not detected.
    * Update documentation
        * Add basic Alpine info to README.md
        * Add Mongo changes notice and suggestions to README.md
        * Change/add README.md recommended launch/run examples for docker-compose.
        * Add info on 'no Mongo' versions
---
* **2018-08-08:**
    * Bump master:sc/VERSION to [5.9.22](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-SDN-Controller-5-9-22-Stable-Candidate-has-been-released/ba-p/2449044)
    * Bump unifi58:stable/VERSION to [5.8.28](https://community.ubnt.com/t5/UniFi-Updates-Blog/UniFi-SDN-Controller-5-8-28-Stable-has-been-released/ba-p/2449036)
    * Copy master:*/Dockerfile curl changes to unifi58 stable and sc
    * Point latest tag at unifi58:stable
    * Tag 5.8.28-release
---
* **2018-08-03:**
    * Move 5.8.X sc to unifi58 branch.
    * Bump master:sc/VERSION to [5.9.20](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-SDN-Controller-5-9-20-Stable-Candidate-has-been-released/ba-p/2443623)
    * Bump unifi58:sc/VERSION to [5.8.28](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-SDN-Controller-5-8-28-Stable-Candidate-has-been-released/ba-p/2443775)
    * Copy master:testing/Dockerfile curl changes to all master branch dynamic tags
    * Delete unifi57 branch - v5.7.X train is "unsupported" by UBNT. https://community.ubnt.com/t5/UniFi-Wireless/UniFi-Controller-Releases-Updated-Jun-27th-2018/m-p/2371605
---
* **2018-07-20:**
    * Update master:testing/Dockerfile to leave curl installed. Covers additional UniFi dependency starting with v5.9.12 release.
---
* **2018-07-20:**
    * Bump master:testing/VERSION to [5.9.16](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-SDN-Controller-5-9-16-Testing-has-been-released/ba-p/2427840)
---
* **2018-07-12:**
    * Bump master:testing/VERSION to [5.9.12](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-SDN-Controller-5-9-12-Testing-has-been-released/ba-p/2418005)
    * Bump master:sc/VERSION to [5.8.25](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-SDN-Controller-5-8-25-Stable-Candidate-has-been-released/ba-p/2418897)
---
* **2018-06-29:**
    * Bump master:stable/VERSION to [5.8.24](https://community.ubnt.com/t5/UniFi-Updates-Blog/UniFi-5-8-24-Stable-has-been-released/ba-p/2404580)
---
* **2018-06-25:**
    * Bump master:stable/VERSION to [5.8.23](https://community.ubnt.com/t5/UniFi-Updates-Blog/UniFi-5-8-23-Stable-has-been-released/ba-p/2399028)
    * Move current and future v5.7 releases to unifi57:stable/VERSION
    * Bump unifi56:stable/VERSION to [5.6.39](https://community.ubnt.com/t5/UniFi-Updates-Blog/UniFi-5-6-39-LTS-Stable-has-been-released/ba-p/2398954)
---
* **2018-06-18:**
    * Bump master:sc/VERSION to [5.8.23](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-5-8-23-Stable-Candidate-has-been-released/ba-p/2390452)
---
* **2018-06-14:**
    * Bump master:sc/VERSION to [5.8.22](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-5-8-22-Stable-Candidate-has-been-released/ba-p/2386690)
    * Update Dockerfile to remove depreciated "MAINTAINER", move info to LABEL "org.label-schema.vendor" value
    * Update Dockerfile for all non-static tags to use UBNT recommended Mongo v3.4 instead of v2.6
---
* **2018-06-07:**
    * Bump master:sc/VERSION to [5.8.21](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-5-8-21-Stable-Candidate-has-been-released/ba-p/2378925)
---
* **2018-05-29:**
    * Bump master:sc/VERSION to [5.8.20](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-5-8-20-Stable-Candidate-has-been-released/ba-p/2368653)
---
* **2018-05-27:**
    * Bump master:sc/VERSION to [5.8.19](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-5-8-19-Stable-Candidate-has-been-released/ba-p/2366443)
---
* **2018-05-22:**
    * Bump unifi57:sc/VERSION to [5.7.28](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-5-7-28-Stable-Candidate-has-been-released/ba-p/2360718)
---
* **2018-05-17:**
    * Bump master:sc/VERSION to [5.8.17](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-5-8-17-Stable-Candidate-has-been-released/ba-p/2353192)
    * Bump unifi57:sc/VERSION to [5.7.27](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-5-7-27-Stable-Candidate-has-been-released/ba-p/2353185)
    * Bump unifi56:sc/VERSION to [5.6.39](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-5-6-39-LTS-Stable-Candidate-has-been-released/ba-p/2353178)
---
* **2018-05-10:**
    * Move 5.7.X sc to unifi57 branch.
    * Bump master:sc/VERSION to [5.8.16](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-5-8-16-Stable-Candidate-has-been-released/ba-p/2345114)
---
* **2018-05-05:**
    * Bump master:sc/VERSION to [5.7.26](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-5-7-26-Stable-Candidate-has-been-released/ba-p/2341045)
    * Bump unifi56:sc/VERSION to [5.6.38](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-5-6-38-LTS-Stable-Candidate-has-been-released/ba-p/2341040)
---
* **2018-05-03:**
    * Bump master:unstable/VERSION to [5.9.4](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-5-9-4-Unstable-has-been-released/ba-p/2339206)
    * Update master:unstable docker-entrypoint.sh script to use "unifi" alias for ssl keystore import instead of "ubnt"
    * Update master:stable,sc,testing docker-entrypoint.sh script to use "unifi" alias for ssl keystore import instead of "ubnt"
    * Update unifi56:stable,sc docker-entrypoint.sh script to use "unifi" alias for ssl keystore import instead of "ubnt"
    * Update documentation to note need to force-rebuild custom SSL keystore for v5.9+ upgrades
---
* **2018-05-01:**
    * Bump master:testing/VERSION to [5.8.15](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-5-8-15-Testing-has-been-released/ba-p/2336031)
---
* **2018-04-23:**
    * Bump master:testing/VERSION to [5.8.14](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-5-8-14-Testing-has-been-released/ba-p/2326882)
---
* **2018-04-18:**
    * Bump master:testing/VERSION to [5.8.12](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-5-8-12-Testing-has-been-released/ba-p/2321460)
    * Bump master:sc/VERSION to [5.7.25](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-5-7-25-Stable-Candidate-has-been-released/ba-p/2320628)
---
* **2018-04-16:**
    * Bump master:stable/VERSION to [5.7.23](https://community.ubnt.com/t5/UniFi-Updates-Blog/UniFi-5-7-23-Stable-has-been-released/ba-p/2318813)
    * Bump unifi56:stable/VERSION to [5.6.37](https://community.ubnt.com/t5/UniFi-Updates-Blog/UniFi-5-6-37-LTS-Stable-has-been-released/ba-p/2318810)
    * Tag stable release 5.7.23
    * Tag stable LTS release 5.6.37
---
* **2018-04-02:**
    * Bump unifi56:sc/VERSION to [5.6.37](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-5-6-37-LTS-Stable-Candidate-has-been-released/ba-p/2302068)
---
* **2018-03-30:**
    * Bump master:testing/VERSION to [5.8.10](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-5-8-10-Testing-has-been-released/ba-p/2299020)
---
* **2018-03-27:**
    * Bump master:sc/VERSION to [5.7.23](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-5-7-23-Stable-Candidate-has-been-released/ba-p/2294842)
---
* **2018-03-19:**
    * Bump master:testing/VERSION to [5.8.8](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-5-8-8-Testing-has-been-released/ba-p/2284459)
---
* **2018-03-13:**
    * Bump unifi56:stable/VERSION to [5.6.36](https://community.ubnt.com/t5/UniFi-Updates-Blog/UniFi-5-6-36-LTS-Stable-has-been-released/ba-p/2277323)
    * Tag stable LTS release 5.6.36
    * Drop unifi54 and unifi55 branches, final release tags remain.
        * No further releases in those trains expected with v5.6.X being LTS.
        * Can be easily re-branched from master for emergency updates if required.
    * Update documentation to reflect changes noted above.
---
* **2018-03-08:**
    * Bump master:stable/VERSION to [5.7.20](https://community.ubnt.com/t5/UniFi-Updates-Blog/UniFi-5-7-20-Stable-has-been-released/ba-p/2271529)
    * Move stable v5.6.30 to unifi56 branch and update README.md to reflect changes
    * Tag stable release 5.7.20
---
* **2018-02-26:**
    * Bump master:sc/VERSION to [5.7.20](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-5-7-20-Stable-Candidate-has-been-released/ba-p/2258831)
---
* **2018-02-23:**
    * Bump unifi56:sc/VERSION to [5.6.36](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-5-6-36-Stable-Candidate-has-been-released/ba-p/2254607)
---
* **2018-02-14:**
    * Bump master:sc/VERSION to [5.7.19](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-5-7-19-Stable-Candidate-has-been-released/ba-p/2244531)
---
* **2018-02-12:**
    * Bump master:testing/VERSION to [5.8.3](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-5-8-3-Testing-has-been-released/ba-p/2241766)
---
* **2018-02-10:**
    * Bump master:sc/VERSION to [5.7.18](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-5-7-18-Stable-Candidate-has-been-released/ba-p/2238507)
---
* **2018-02-09:**
    * Bump unifi56:sc/VERSION to [5.6.35](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-5-6-35-Stable-Candidate-has-been-released/ba-p/2238153)
---
* **2018-02-08:**
    * Bump unifi56:sc/VERSION to [5.6.34](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-5-6-34-Stable-Candidate-has-been-released/ba-p/2236145)
---
* **2018-02-01:**
    * Bump unifi56:sc/VERSION to [5.6.31](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-5-6-31-Stable-Candidate-has-been-released/ba-p/2228608)
    * Update README.md - forgot to tag release-5.6.30 on 2018-01-26
---
* **2018-01-26:**
    * Bump master:stable/VERSION to [5.6.30](https://community.ubnt.com/t5/UniFi-Updates-Blog/UniFi-5-6-30-Stable-has-been-released/ba-p/2220761)
---
* **2018-01-12:**
    * Bump master:sc/VERSION to [5.7.15](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-5-7-15-Stable-Candidate-has-been-released/ba-p/2203643)
---
* **2018-01-10:**
    * Bump unifi56:sc/VERSION to [5.6.30](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-5-6-30-Stable-Candidate-has-been-released/ba-p/2201359)
---
* **2018-01-02:**
    * Bump master:stable/VERSION to [5.6.29](https://community.ubnt.com/t5/UniFi-Updates-Blog/UniFi-5-6-29-Stable-has-been-released/ba-p/2191996)
---
* **2017-12-27:**
    * Create unifi56 branch allowing for v5.7.X stable candidates/stable and pending v5.6.X move to LTS
    * Bump master:sc/VERSION to [5.7.12](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-5-7-12-Stable-Candidate-has-been-released/ba-p/2186624)
    * Update README.md
        * Document branch changes, add unifi56-sc tag
        * Copy over UBNT warning/links regarding 5.7.12 required AP firmware pre-upgrade to 3.9.18.8086
---
* **2017-12-20:**
    * Bump master:testing/VERSION to [5.7.11](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-5-7-11-Testing-has-been-released/ba-p/2180775)
    * Update README.md URL for sc 5.6.29 to point to non-beta blog announcement https://community.ubnt.com/t5/UniFi-Updates-Blog/UniFi-5-6-29-Stable-Candidate-has-been-released/ba-p/2180909
---
* **2017-12-16:**
    * Bump master:sc/VERSION to [5.6.29](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-5-6-29-Stable-Candidate-has-been-released/ba-p/2176631)
    * Change *:*/Dockerfile to use updated UniFi package download URL - https://dl.ubnt.com/unifi/$VERSION/unifi_sysvinit_all.deb
---
* **2017-12-11:**
    * Bump master:sc/VERSION to [5.6.27](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-5-6-27-Stable-Candidate-has-been-released/ba-p/2169686)
    * Bump master:testing/VERSION to [5.7.10](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-5-7-10-Testing-has-been-released/ba-p/2169697)
---
* **2017-12-08:**
    * Bump master:testing/VERSION to [5.7.9](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-5-7-9-Testing-has-been-released/ba-p/2166660)
    * Update README.md
        * Demphasize and re-word non-priveleged user verbage.
---
* **2017-12-07:**
    * Bump master:stable/VERSION to [5.6.26](https://community.ubnt.com/t5/UniFi-Updates-Blog/UniFi-5-6-26-Stable-has-been-released/ba-p/2165432)
---
* **2017-12-04:**
    * Bump master:sc/VERSION to [5.6.26](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-5-6-26-Stable-Candidate-has-been-released/ba-p/2161106)
---
* **2017-11-28:**
    * Bump master:sc/VERSION to [5.6.25](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-5-6-25-Stable-Candidate-has-been-released/ba-p/2154030)
---
* **2017-11-24:**
    * Bump master:unstable/VERSION to [5.7.8](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-5-7-8-Unstable-has-been-released/ba-p/2149934)
---
* **2017-11-18:**
    * Bump master:unstable/VERSION to [5.7.7](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-5-7-7-Unstable-has-been-released/ba-p/2143273)
---
* **2017-11-16:**
    * Bump master:sc/VERSION to [5.6.24](https://community.ubnt.com/t5/UniFi-Updates-Blog/UniFi-5-6-24-Stable-Candidate-has-been-released/ba-p/2141297)
---
* **2017-11-10:**
    * Bump master:unstable/VERSION to [5.7.4](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-5-7-4-Unstable-has-been-released/ba-p/2134310)
---
* **2017-11-09:**
    * Bump master:stable/VERSION to [5.6.22](https://community.ubnt.com/t5/UniFi-Updates-Blog/UniFi-5-6-22-Stable-has-been-released/ba-p/2131913)
---
* **2017-11-08:**
    * Bump master:sc/VERSION to [5.6.23](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-5-6-23-Stable-Candidate-has-been-released/ba-p/2131134)
---
* **2017-11-06:**
    * Bump master:sc/VERSION to [5.6.22](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-5-6-22-Stable-Candidate-has-been-released/ba-p/2127830)
---
* **2017-10-31:**
    * Bump master:unstable/VERSION to [5.7.3](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-5-7-3-Unstable-has-been-released/ba-p/2119632)
---
* **2017-10-30:**
    * Bump master:stable/VERSION to [5.6.20](https://community.ubnt.com/t5/UniFi-Updates-Blog/UniFi-5-6-20-Stable-has-been-released/ba-p/2119397)
---
* **2017-10-25:**
    * Bump master:sc/VERSION to [5.6.20](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-5-6-20-Stable-Candidate-has-been-released/ba-p/2113208)
    * Bump unifi55:sc/VERSION to [5.5.27](https://community.ubnt.com/t5/UniFi-Beta-Blog/UniFi-5-5-27-LTS-Stable-Candidate-has-been-released/ba-p/2113202)
    * Update README.md
        * Table updates for version adds/changes
* **2017-10-23:**
    * Bump master:stable/VERSION to [5.6.19](https://community.ubnt.com/t5/UniFi-Updates-Blog/UniFi-5-6-19-Stable-has-been-released/ba-p/2109621)
    * Update README.md
        * Drop unifi54 (Git branch/tag on Docker Hub still exist) and release-5.4.19 from tags table
        * Add/Re-add unifi55 branch/tag info
    * Add GitHub docs folder
        * Move CONTRIBUTING.md from root
        * Create ISSUE_TEMPLATE.md
        * Create PULL_REQUEST_TEMPLATE.md
    * Update .dockerignore to exclude docs folder
---
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
