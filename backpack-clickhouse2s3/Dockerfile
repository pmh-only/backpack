FROM alpine:latest

RUN apk add --no-cache aws-cli curl tzdata

COPY ./backpack /usr/bin/

ENTRYPOINT [ "/usr/bin/backpack" ]
