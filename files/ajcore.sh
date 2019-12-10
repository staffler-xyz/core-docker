#!/bin/bash

export HOME=/config

if [[ ! -f ${HOME}/appleJuice/server.xml ]]; then
  cp /opt/appleJuice/server.xml ${HOME}/appleJuice/server.xml
fi

if [[ ! -f ${HOME}/appleJuice/settings.xml ]]; then
  cp /opt/appleJuice/settings.xml ${HOME}/appleJuice/settings.xml
  sed -i "s/dockerianer/dockerianer${RANDOM}/" ${HOME}/appleJuice/settings.xml
fi

java "${JAVA_OPTIONS}" -Duser.home=${HOME} -jar /opt/appleJuice/ajcore.jar