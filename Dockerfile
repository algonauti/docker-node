FROM node:14-alpine3.14

RUN apk add --update --no-cache \
      bash \
      git \
      chromium


RUN adduser tomster -s /bin/bash -D


ENV CHROME_BIN=/usr/bin/chromium-browser \
    CHROME_PATH=/usr/lib/chromium/ \
    CI=true

# Testem looks for google-chrome
RUN ln -s /usr/bin/chromium-browser /usr/bin/google-chrome

USER tomster
