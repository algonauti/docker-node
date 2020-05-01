FROM node:12-alpine

RUN apk add --update --no-cache \
      bash \
      chromium


RUN adduser tomster -s /bin/bash -D

USER tomster
