FROM ruby:2.7.2-slim-buster
RUN apt update && apt install -y \
        # ruby-dev \
        build-essential  \
        libpq-dev \
        libicu-dev

RUN gem install bundler
RUN mkdir /app
WORKDIR /app
COPY Gemfile ./Gemfile
RUN bundle install
COPY . .
