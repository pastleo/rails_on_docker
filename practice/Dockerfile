
FROM ruby:2.3

RUN \
curl -sL https://deb.nodesource.com/setup_6.x | bash - && \
apt-get install -y nodejs && \
apt-get clean && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY Gemfile /usr/src/app/
COPY Gemfile.lock /usr/src/app/

RUN bundle install

ADD . /usr/src/app
CMD rails s -b 0.0.0.0
