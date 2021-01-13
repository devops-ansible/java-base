#!/usr/bin/env bash

###
## changing user id and group id for application user if necessary
###

if [ "${DEFAULT_APP_USER}" != "" ]; then
    if [ "${DEFAULT_APP_UID}" -ne "0" ]; then

        ###
        ## Adding application user
        ###

        useradd "${DEFAULT_APP_USER}"

        ###
        ## Changing IDs
        ###

        usermod  -u ${DEFAULT_APP_UID} "${DEFAULT_APP_USER}"
        if [ $? -ne 0 ]; then
            echo "Applicationuser \"${DEFAULT_APP_USER}\" could not be created with UID \"${DEFAULT_APP_UID}\""
            exit 1
        fi

        groupmod -g ${DEFAULT_APP_GID} "${DEFAULT_APP_USER}"
        if [ $? -ne 0 ]; then
            echo "Applicationuser \"${DEFAULT_APP_USER}\" could not be created with default group \"${DEFAULT_APP_GID}\""
            GNAME=$(getent group ${DEFAULT_APP_GID} | cut -d: -f1)
            usermod -a -G "${GNAME}" "${DEFAULT_APP_USER}"
            echo "Added applicationuser to existing group \"${GNAME}\" instead"
        fi

    fi
fi
