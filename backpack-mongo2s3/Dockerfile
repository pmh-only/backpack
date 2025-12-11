FROM alpine:latest

RUN apk add --no-cache aws-cli postgresql-client tzdata

COPY ./backpack /usr/bin/

ENTRYPOINT [ "/usr/bin/backpack" ]
