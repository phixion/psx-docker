FROM lsiobase/alpine:3.9

ARG BUILD_DATE
ARG VERSION
LABEL build_version="version: ${VERSION} date: ${BUILD_DATE}"

ARG PSXVER="v0.4.6a1"

RUN apk add --no-cache \
     wget \
     python3 && \
 cd /opt && \
 wget https://github.com/Al-Azif/ps4-exploit-host/releases/download/$PSXVER/ps4-exploit-host-$PSXVER.zip && \
 unzip /opt/ps4-exploit-host-$PSXVER.zip && \
 rm -rf \
        /tmp/*

COPY root/ /

EXPOSE 53 80
