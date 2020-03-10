FROM lsiobase/alpine:3.11

ARG BUILD_DATE
ARG VERSION
ARG VCS_REF
ARG TARGETARCH

ENV HOME /config

ADD https://github.com/red171/applejuice-libajnetmask/releases/download/1.0.0/libajnetmask-${TARGETARCH}.so /usr/lib/libajnetmask.so

RUN apk add --no-cache curl openjdk8-jre && \
    chmod +r /usr/lib/libajnetmask.so

COPY rootfs/ /

EXPOSE 9850 9851

WORKDIR /config/appleJuice

VOLUME /config/appleJuice

HEALTHCHECK --interval=30s --start-period=10s CMD curl --fail http://localhost:9851 || exit 1

LABEL build_version="appleJuice Core ${VERSION}" \
      maintainer="red171" \
      org.label-schema.name="appleJuice Core" \
      org.label-schema.vcs-ref=${VCS_REF} \
      org.label-schema.build-date=${BUILD_DATE} \
      org.label-schema.vcs-url="https://github.com/red171/applejuice-docker-core" \
      org.label-schema.version=${VERSION} \
      org.label-schema.schema-version="1.0"