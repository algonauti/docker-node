FROM node:18-alpine3.16

ENV CHROME_BIN=/usr/bin/chromium-browser \
    CHROME_PATH=/usr/lib/chromium/ \
    CI=true

ENV CHROMIUM_FLAGS="--disable-gpu"

RUN apk add --update --no-cache \
      bash \
      git \
      chromium \
      chromium-swiftshader

RUN adduser tomster -s /bin/bash -D

# Testem looks for google-chrome
RUN ln -s /usr/bin/chromium-browser /usr/bin/google-chrome

USER tomster
