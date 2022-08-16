FROM ruby:2.7.2-slim-buster
RUN apt update && apt install -y \
        # ruby-dev \
        build-essential  \
        libpq-dev \
        libicu-dev 
        # graphviz

# RUN gem install bundler
# RUN gem install ruby-graphviz

ARG RAILS_ROOT=/app
RUN mkdir $RAILS_ROOT
WORKDIR $RAILS_ROOT

# Pre-install gems
COPY Gemfile* ./
RUN gem install bundler && bundle install

# Copy app files
COPY . .

# Run server
EXPOSE 3000
CMD bundle exec rails s -b 0.0.0.0 -p 3000
