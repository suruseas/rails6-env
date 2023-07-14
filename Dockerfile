FROM ruby:3.2-slim

RUN apt-get update -qq && \
    apt-get install -yq --no-install-recommends \
    build-essential \
    git \
    libpq-dev \
    vim \
    curl \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# install nodejs(LTS)
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - && apt-get install -y nodejs

# install yarn
RUN npm install --global yarn

ENV LANG=C.UTF-8 \
    BUNDLE_JOBS=4 \
    BUNDLE_RETRY=3

RUN gem install bundler

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

CMD ['bin/bash']
