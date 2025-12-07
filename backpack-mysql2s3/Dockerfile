FROM alpine:latest

RUN apk add --no-cache aws-cli mariadb-client tzdata

COPY ./entrypoint.sh /

ENTRYPOINT [ "/entrypoint.sh" ]
