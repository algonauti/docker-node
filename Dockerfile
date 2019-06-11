FROM node:11

MAINTAINER Salvatore Ferrucci <salvatore@algonauti.com>

# Install dumb-init (Very handy for easier signal handling of SIGINT/SIGTERM/SIGKILL etc.)
RUN wget https://github.com/Yelp/dumb-init/releases/download/v1.2.0/dumb-init_1.2.0_amd64.deb \
  && dpkg -i dumb-init_*.deb

# Install Google Chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
  && sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
  && apt-get update && apt-get install -y google-chrome-stable

RUN useradd tomster --shell /bin/bash --create-home

USER tomster

ENTRYPOINT ["dumb-init"]
