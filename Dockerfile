FROM ruby:2.6.2
LABEL maintainer="austinculter@gmail.com"
LABEL version="0.1.0"

COPY Gemfile /
RUN bundle install --gemfile /Gemfile

COPY config.yml /

EXPOSE 9292
CMD ["bundle", "exec", "gemstash", "start", "--no-daemonize", "--config-file", "/config.yml"]
