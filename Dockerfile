FROM alpine:3.9
LABEL maintainer="austinculter@gmail.com"
LABEL version="0.2.0"

COPY Gemfile config.yml docker_health.rb /

RUN apk update && \
    apk add --no-cache ruby=2.5.5-r0 ruby-bigdecimal=2.5.5-r0 ruby-bundler=2.5.5-r0 ruby-io-console=2.5.5-r0 ruby-irb=2.5.5-r0 ca-certificates=20190108-r0 libressl=2.7.5-r0 sqlite=3.26.0-r3 && \
    apk add --no-cache --virtual build-deps build-base=0.5-r1 ruby-dev=2.5.5-r0 libressl-dev=2.7.5-r0 sqlite-dev=3.26.0-r3 && \
    bundle install --gemfile /Gemfile --without development

ENTRYPOINT ["bundle", "exec", "gemstash", "start", "--no-daemonize", "--config-file", "/config.yml"]

HEALTHCHECK CMD ruby docker_health.rb
