FROM ruby:2.7.0
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs  postgresql-client

RUN mkdir /my_app
ENV APP_ROOT /my_app
WORKDIR $APP_ROOT

COPY ./Gemfile $APP_ROOT/Gemfile
COPY ./Gemfile.lock $APP_ROOT/Gemfile.lock
COPY ./initialize.sh /docker-entrypoint-initdb.d/

RUN set -x && gem update --system && gem install bundler:2.1.4
RUN bundle install
COPY . $APP_ROOT

CMD ["rails", "server", "-b", "0.0.0.0"]
