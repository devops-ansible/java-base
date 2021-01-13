# Java Base Docker Image

Docker images provided within this repository are built on the needs of it economics GmbH.

## Environmental Variables

This image is customizable by these environmental variables:

| env                   | default               | change recommended | description |
| --------------------- | --------------------- |:------------------:| ----------- |
| **CUSTOM_TIMEZONE**   | *"Europe/Berlin"*     | yes                | timezone-file to use as default – can be one value selected out of `/usr/share/zoneinfo/`, i.e. `<region>/<city>` |
| **SET_LOCALE**        | *"de_DE.UTF-8"*       | yes                | LOCALE to be installed by default |
| **JAVA_HOME**         | */usr/lib/jvm/java-8-openjdk-amd64/* | no  | base image for Java executible files – should not be changed unless you install and use another Java version |
| **REFRESHED_AT**      | DATE                  | no                 | that's the date when the base image was last updated | 
| **DEFAULT_APP_UID**   |  *0*                  | yes                | only relevant, if `DEFAULT_APP_USER` not empty – change to specific UID, if it should not be automatically generated |
| **DEFAULT_APP_GID**   |  *0*                  | yes                | only relevant, if `DEFAULT_APP_USER` not empty – change to specific GID, if it should not be automatically generated |
| **DEFAULT_APP_USER**  |  *""*    | yes                | set to the application user name, `DEFAULT_APP_UID` and `DEFAULT_APP_GID` should affect – if empty, none of them will take effect |


## Files and directories to be aware of

### `/boot.d/` – direcotry for additional scripts on bootup

If you want to do the container sth on bootup, this folder is the location to place your `*.sh`-files.

When extending this image, don't forget to run `/boot.sh` within your `Entrypoint`!

## Contribution guidelines

This Repository is Creative Commons non Commercial - You can contribute by forking and using pull requests. The team will review them asap.
