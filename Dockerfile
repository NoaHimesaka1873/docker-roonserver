FROM debian:12-slim
LABEL org.opencontainers.image.authors="himesaka@noa.codes"

RUN apt-get update \
        && apt-get -y upgrade \
        && apt-get -y install bash curl bzip2 ffmpeg cifs-utils alsa-utils libicu72

ENV ROON_VERSION STABLE
ENV ROON_DATAROOT /data
ENV ROON_ID_DIR /data

VOLUME [ "/app", "/data", "/music", "/backup" ]

ADD run.sh /
ENTRYPOINT /run.sh
