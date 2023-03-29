FROM ruby:2.7.2-slim-buster

RUN apt update && apt install -y \
        # ruby-dev \
        curl \
        build-essential  \
        libpq-dev \
        libicu-dev 
        # graphviz

# RUN gem install bundler
# RUN gem install ruby-graphviz

# ARG RAILS_ROOT=/app
# RUN mkdir $RAILS_ROOT
# WORKDIR $RAILS_ROOT

ARG UNAME=ruby
ARG UID=1000
ARG GID=1000
RUN groupadd -g $GID -o $UNAME
RUN useradd -m -u $UID -g $GID -o -s /bin/bash $UNAME
USER $UNAME

# Pre-install gems
ARG TMPDIR=/tmp
COPY Gemfile* ${TMPDIR}/
RUN cd ${TMPDIR} && \
        gem install bundler && \
        bundle install
# RUN bundle info rails
# Copy app files
# COPY . .

# Run server
EXPOSE 3000
CMD bundle exec rails s -b 0.0.0.0 -p 3000
