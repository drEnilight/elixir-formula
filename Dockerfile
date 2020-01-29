FROM ruby:2.4.2-slim

# Optionally set a maintainer name to let people know who made this image.
MAINTAINER drEnilight <romanuk_v@live.ru>

# We need wget to set up the PPA and xvfb to have a virtual screen and unzip to install the Chromedriver
RUN apt-get update -qq && apt-get install -y wget xvfb

# Set the Chrome repo.
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list

# Common dependencies
# libpq-dev - postgres dependency
# openssh-client - using capistrano inside docker container

RUN apt-get update -qq \
  && apt-get install -yq --no-install-recommends \
    build-essential \
    glib-2.0 \
    google-chrome-stable \
    libpq-dev \
    nodejs \
    openssh-client \
    postgresql-client \
  && apt-get clean \
  && rm -rf /var/cache/apt/archives/* \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  && truncate -s 0 /var/log/*log

RUN mkdir /elixir_formula

WORKDIR /elixir_formula

COPY Gemfile /elixir_formula/Gemfile
COPY Gemfile.lock /elixir_formula/Gemfile.lock

RUN bundle install

COPY . /elixir_formula
