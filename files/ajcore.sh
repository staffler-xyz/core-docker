#!/usr/bin/env bash

if [[ ! -f /root/appleJuice/server.xml ]]; then
    cp /opt/appleJuice/server.xml /root/appleJuice/server.xml
fi

if [[ ! -f /root/appleJuice/settings.xml ]]; then
    cp /opt/appleJuice/settings.xml /root/appleJuice/settings.xml
    sed -i "s/dockerianer/dockerianer${RANDOM}/" /root/appleJuice/settings.xml
fi

cd /opt/appleJuice/

java -Djava.library.path=. -jar ajcore.jar