FROM ruby:2.3.1
MAINTAINER Guillaume FAURE-DUMONT
RUN apt-get update -qq && apt-get install -y build-essential postgresql-contrib nodejs npm nodejs-legacy
RUN gem install foreman
RUN gem install pry
RUN npm install -g bower
RUN echo '{ "allow_root": true }' > /root/.bowerrc
RUN echo 'gem: --no-document' > /root/.gemrc

RUN mkdir /leprojet

WORKDIR /tmp
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install

ADD . /leprojet
WORKDIR /leprojet
