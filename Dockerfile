FROM node:14-alpine3.14

ENV CHROME_BIN=/usr/bin/chromium-browser \
    CHROME_PATH=/usr/lib/chromium/ \
    CI=true

RUN apk add --update --no-cache \
      bash \
      git \
      mesa-gles \
      chromium


RUN mkdir -p $CHROME_PATH/swiftshader/; \
    ln -s /usr/lib/libGLESv2.so $CHROME_PATH/swiftshader/libGLESv2.so.2;

RUN adduser tomster -s /bin/bash -D

# Testem looks for google-chrome
RUN ln -s /usr/bin/chromium-browser /usr/bin/google-chrome

USER tomster
