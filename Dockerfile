FROM alpine

ARG TAG

RUN if [ -z ${TAG} ]; then apk add --no-cache samba; else apk add --no-cache samba=$TAG; fi

COPY ./entrypoint.sh /

EXPOSE 445

ENTRYPOINT ["/entrypoint.sh"]

CMD ["/usr/sbin/smbd", "--foreground", "--no-process-group", "--debug-stdout"]
