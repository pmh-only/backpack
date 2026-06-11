FROM alpine:latest

RUN apk add --no-cache aws-cli tzdata npm

RUN npm install -g @bitwarden/cli
COPY ./backpack /usr/bin/

ENTRYPOINT [ "/usr/bin/backpack" ]
