FROM devopsansiblede/baseimage

MAINTAINER Felix Kazuya <me@felixkazuya.de>
MAINTAINER Christian Walonka <cwalonka@it-economics.de>
MAINTAINER Martin Winter <mwinter@it-economics.de>

ENV REFRESHED_AT      2020-10-12
ENV JAVA_HOME         /usr/lib/jvm/java-8-openjdk-amd64/
ENV CUSTOM_TIMEZONE   "Europe/Berlin"
ENV SET_LOCALE        "de_DE.UTF-8"
ENV DEFAULT_APP_UID   0
ENV DEFAULT_APP_GID   0
ENV DEFAULT_APP_USER  ""

WORKDIR /

COPY files/ /
RUN chmod a+x /install.sh && \
    /install.sh && \
    rm -f /install.sh

CMD [ "/bin/bash"]

