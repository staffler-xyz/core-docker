FROM debian:stretch

RUN dpkg --add-architecture i386 && \
    apt update -y && \
    apt install -y supervisor execstack default-jre-headless:i386 && \
    apt clean

RUN update-alternatives --set java $(update-alternatives --list java | grep i386)

RUN mkdir -p /opt/appleJuice/ && mkdir -p /root/appleJuice/

COPY files/* /opt/appleJuice/

# mark shared library as not requiring executable stack
RUN execstack -c /opt/appleJuice/libajnetmask.so

RUN chmod +x /opt/appleJuice/ajcore.sh

WORKDIR /root/appleJuice/

VOLUME /root/appleJuice/

EXPOSE 9850 9851

ENTRYPOINT ["/opt/appleJuice/ajcore.sh"]