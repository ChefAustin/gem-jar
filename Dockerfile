FROM ruby:2.6.2
LABEL maintainer="austinculter@gmail.com"

COPY Gemfile /
RUN bundle install --gemfile /Gemfile

COPY config.yml /

EXPOSE 9292
CMD ["bundle", "exec", "gemstash", "start", "--no-daemonize", "--config-file", "/config.yml"]
