FROM alpine:latest

RUN apk add --no-cache aws-cli mariadb-client mariadb-connector-c tzdata

COPY ./backpack /usr/bin/

ENTRYPOINT [ "/usr/bin/backpack" ]
