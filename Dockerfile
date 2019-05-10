FROM ruby:2.6.2
LABEL maintainer="austinculter@gmail.com"
LABEL version="0.1.2"

COPY Gemfile* config.yml docker_health.rb /
RUN bundle install --gemfile /Gemfile

CMD ["bundle", "exec", "gemstash", "start", "--no-daemonize", "--config-file", "/config.yml"]

HEALTHCHECK CMD ruby docker_health.rb
