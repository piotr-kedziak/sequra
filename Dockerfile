FROM ruby:3.2
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN apt-get update -yqq && apt-get install -y lsb-release build-essential nodejs openssh-client && apt-get clean all

RUN useradd -m user

# PostgreSQL client install
RUN echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
RUN apt-get update -yqq && apt-get install -y postgresql-client

ENV APP_HOME=/sequra
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

COPY Gemfile $APP_HOME/Gemfile
COPY Gemfile.lock $APP_HOME/Gemfile.lock

ENV GEM_HOME=/bundle
ENV PATH=$GEM_HOME/bin:$GEM_HOME/gems/bin:$PATH

RUN gem install bundler
RUN bundle install

COPY . $APP_HOME
