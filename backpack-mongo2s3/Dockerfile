FROM alpine:latest

RUN apk add --no-cache aws-cli mongodb-tools tzdata

COPY ./backpack /usr/bin/

ENTRYPOINT [ "/usr/bin/backpack" ]
