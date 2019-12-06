FROM debian:stretch

ARG BUILD_DATE
ARG VCS_REF

ENV USER=app
ENV UID=1000
ENV GID=1000

RUN dpkg --add-architecture i386 && \
    apt update -y && \
    apt install -y curl execstack default-jre-headless:i386 && \
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

HEALTHCHECK --interval=60s --start-period=30s CMD curl --fail http://localhost:9851 || exit 1

LABEL org.label-schema.name="appleJuice Core" \
      org.label-schema.vcs-ref=${VCS_REF} \
      org.label-schema.build-date=${BUILD_DATE} \
      org.label-schema.vcs-url="https://bitbucket.org/red171/applejuice-docker-core" \
      org.label-schema.schema-version="1.0"