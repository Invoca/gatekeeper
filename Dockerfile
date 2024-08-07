FROM invocaops/ruby:2.7.8-bullseye
LABEL maintainer="SRE <sre@invoca.com>"

WORKDIR /usr/src/gatekeeper
RUN gem install bundler -v '2.1.4'
COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY gatekeeper/ .
EXPOSE 4567
CMD ["bundle", "exec", "rackup", "-p", "4567", "-o", "0.0.0.0"]
