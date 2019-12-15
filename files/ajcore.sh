#!/bin/sh

if [ ! -f ${HOME}/appleJuice/server.xml ]; then
  cp /opt/appleJuice/server.xml ${HOME}/appleJuice/server.xml
fi

if [ ! -f ${HOME}/appleJuice/settings.xml ]; then
  cp /opt/appleJuice/settings.xml ${HOME}/appleJuice/settings.xml
fi

java -Duser.home=${HOME} -XX:MaxRAMPercentage=95.0 -jar /opt/appleJuice/ajcore.jar
