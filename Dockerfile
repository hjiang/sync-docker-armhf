# Resilio Sync
#
# VERSION               0.1
#

FROM arm32v7/debian:latest
MAINTAINER lazyseq@gmail.com
LABEL com.resilio.version="2.6.3"

RUN apt-get update
RUN apt-get install -y ca-certificates

ADD https://download-cdn.resilio.com/2.6.3/linux-armhf/resilio-sync_armhf.tar.gz /tmp/sync.tgz
RUN tar -xf /tmp/sync.tgz -C /usr/bin rslsync && rm -f /tmp/sync.tgz

COPY sync.conf.default /etc/
COPY run_sync /usr/bin/

EXPOSE 8888
EXPOSE 55555

VOLUME /mnt/sync

ENTRYPOINT ["run_sync"]
CMD ["--config", "/mnt/sync/sync.conf"]
