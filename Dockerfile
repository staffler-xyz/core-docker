FROM debian:stretch

ENV USER=app
ENV UID=1000
ENV GID=1000

RUN dpkg --add-architecture i386 && \
    apt update -y && \
    apt install -y execstack default-jre-headless:i386 && \
    apt clean

RUN update-alternatives --set java $(update-alternatives --list java | grep i386)

RUN addgroup --gid "$GID" "$USER" \
    && adduser \
    --disabled-password \
    --gecos "" \
    --home "/config" \
    --ingroup "$USER" \
    --uid "$UID" \
    "$USER"

RUN mkdir -p /opt/appleJuice/

COPY files/* /opt/appleJuice/

RUN mv /opt/appleJuice/libajnetmask.so /usr/lib/libajnetmask.so && execstack -c /usr/lib/libajnetmask.so

EXPOSE 9850 9851

USER $USER

ENTRYPOINT ["/opt/appleJuice/ajcore.sh"]

VOLUME /config/appleJuice/

WORKDIR /config/appleJuice/