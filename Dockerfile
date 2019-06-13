FROM  debian:stretch

RUN dpkg --add-architecture i386

RUN apt update -y

RUN apt install -y execstack default-jre-headless:i386

RUN update-alternatives --set java $(update-alternatives --list java | grep i386)

# appleJuice stuff

RUN mkdir -p /opt/appleJuice/
RUN mkdir -p /root/appleJuice/

COPY files/* /opt/appleJuice/

RUN execstack -c /opt/appleJuice/libajnetmask.so

RUN chmod +x /opt/appleJuice/ajcore.sh

WORKDIR /root/appleJuice/

VOLUME /root/appleJuice/

EXPOSE 9001 9851

#ENTRYPOINT tail -f /dev/null

ENTRYPOINT ["/opt/appleJuice/ajcore.sh"]