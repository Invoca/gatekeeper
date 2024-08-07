FROM invocaops/ruby:2.7.5-bullseye
LABEL maintainer="SRE <sre@invoca.com>"

WORKDIR /usr/src/gatekeeper
RUN gem install bundler -v '1.17.3'
COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY gatekeeper/ .
EXPOSE 4567
CMD ["bundle", "exec", "rackup", "-p", "4567", "-o", "0.0.0.0"]
