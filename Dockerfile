FROM alpine:3.9

MAINTAINER phixion

ARG BUILD_DATE
ARG VERSION
LABEL build_version="version: ${VERSION} date: ${BUILD_DATE}"

ARG PS4EXPLOITHOSTVER="v0.4.6a1"

RUN apk add --no-cache \
     wget \
     python3 && \

 cd /app && \
 wget https://github.com/Al-Azif/ps4-exploit-host/releases/download/v$PS4EXPLOITHOSTVER/ps4-exploit-host-$PS4EXPLOITHOSTVER.zip && \
 unzip /app/ps4-exploit-host-$PS4EXPLOITHOSTVER.zip && \
 rm -rf \
        /tmp/*

COPY root/ /

EXPOSE 53 80
