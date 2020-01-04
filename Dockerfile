FROM ruby:2.4.2-slim

# Optionally set a maintainer name to let people know who made this image.
MAINTAINER drEnilight <romanuk_v@live.ru>

# Common dependencies
# libpq-dev - postgres dependency
# openssh-client - using capistrano inside docker container

RUN apt-get update -qq \
  && apt-get install -yq --no-install-recommends \
    build-essential \
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
