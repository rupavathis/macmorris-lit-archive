# FROM ruby:2.7.2-alpine
FROM ruby:slim-buster
# RUN apk update && apk add nodejs build-base libxml2-dev libxslt-dev postgresql postgresql-dev 
RUN apt update && apt install -y ruby-dev 
RUN apt install -y build-essential && gem install rails &&  gem install rails_admin && apt install -y libpq-dev
RUN gem install bundler
RUN mkdir /app
WORKDIR /app
COPY Gemfile ./Gemfile
COPY Gemfile.lock ./Gemfile.lock
RUN bundle install
COPY . .
