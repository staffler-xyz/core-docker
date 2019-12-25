FROM openjdk:8-jre-alpine

ARG BUILD_DATE
ARG VCS_REF

ENV USER=app
ENV UID=1000
ENV GID=1000

RUN apk add curl

RUN addgroup -g $GID $USER && adduser -u $UID -G $USER -s /bin/sh -D $USER --home "/config"

RUN mkdir -p /opt/appleJuice/

ADD files/ /opt/appleJuice/

ADD https://github.com/red171/applejuice-libajnetmask/releases/download/1.0.0/libajnetmask-amd64.so /usr/lib/libajnetmask.so

RUN chmod +r /usr/lib/libajnetmask.so

EXPOSE 9850 9851

USER $USER

ENTRYPOINT ["/opt/appleJuice/ajcore.sh"]

VOLUME /config/appleJuice/

WORKDIR /config/appleJuice/

HEALTHCHECK --interval=30s --start-period=10s CMD curl --fail http://localhost:9851 || exit 1

LABEL org.label-schema.name="appleJuice Core" \
      org.label-schema.vcs-ref=${VCS_REF} \
      org.label-schema.build-date=${BUILD_DATE} \
      org.label-schema.vcs-url="https://github.com/red171/applejuice-docker-core" \
      org.label-schema.schema-version="1.0"