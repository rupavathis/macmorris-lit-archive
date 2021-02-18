FROM ruby:slim-buster
RUN apt update && apt install -y ruby-dev 
RUN apt install -y build-essential 
RUN apt install -y libpq-dev
RUN apt install -y libicu-dev
RUN gem install bundler
RUN mkdir /app
WORKDIR /app
COPY Gemfile ./Gemfile
RUN bundle install
COPY . .
