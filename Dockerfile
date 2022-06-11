FROM lsiobase/alpine:3.9

ARG BUILD_DATE
ARG VERSION
LABEL build_version="${VERSION} ${BUILD_DATE}"

ARG PSXVER="v0.4.5"

RUN apk add --no-cache \
     wget \
     unzip \
     python3 && \
    cd /tmp && \
    wget https://github.com/Al-Azif/ps4-exploit-host/releases/download/$PSXVER/ps4-exploit-host-$PSXVER.zip && \
    unzip /tmp/ps4-exploit-host-$PSXVER.zip && \
    cp -r /tmp/ps4-exploit-host /opt/psx-docker && \
    rm -rf \
    /tmp/*

COPY root/ /

EXPOSE 53 80
