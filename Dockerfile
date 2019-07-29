FROM debian:stretch

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
 && apt-get install -y \
    samba \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

COPY ./entrypoint.sh /

EXPOSE 445

ENTRYPOINT ["/entrypoint.sh"]

CMD ["/usr/sbin/smbd", "--foreground", "--log-stdout"]
