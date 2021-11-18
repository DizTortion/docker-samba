FROM alpine

ARG TAG

RUN apk add --no-cache samba=$TAG

COPY ./entrypoint.sh /

EXPOSE 445

ENTRYPOINT ["/entrypoint.sh"]

CMD ["/usr/sbin/smbd", "--foreground", "--log-stdout", "--no-process-group"]
