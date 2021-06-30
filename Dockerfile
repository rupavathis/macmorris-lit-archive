FROM ruby:2.7.2-slim-buster
RUN apt update && apt install -y \
        # ruby-dev \
        build-essential  \
        libpq-dev \
        libicu-dev 
        # graphviz

RUN gem install bundler
# RUN gem install ruby-graphviz
RUN mkdir /app
WORKDIR /app
COPY Gemfile ./Gemfile
RUN bundle install
COPY . . 
