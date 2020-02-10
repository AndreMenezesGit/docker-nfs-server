FROM alpine:3.7

MAINTAINER Andre Menezes <Git::andreMenezesGit>

RUN apk --update upgrade && \
    apk add bash nfs-utils && \
    rm -rf /var/cache/apk/*

COPY ["/exports.sh","/"]
COPY ["/entrypoint.sh","/"]
RUN ["chmod","755","/exports.sh"]
RUN ["chmod","755","/entrypoint.sh"]

EXPOSE 2049/tcp 2049/udp

ENTRYPOINT ["/entrypoint.sh"]