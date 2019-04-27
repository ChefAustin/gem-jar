FROM ruby:2.6.2
LABEL maintainer="austinculter@gmail.com"

RUN mkdir -p /root/.gemstash

WORKDIR /root/.gemstash
COPY Gemfile /root/.gemstash
RUN bundle install --gemfile /root/.gemstash/Gemfile

COPY config.yml /root/.gemstash

EXPOSE 9292
CMD ["bundle", "exec", "gemstash", "start", "--no-daemonize"]
