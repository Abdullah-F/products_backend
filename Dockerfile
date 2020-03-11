FROM ruby:2.6.3-alpine

RUN apk update && apk upgrade && \
apk add ruby ruby-json ruby-io-console ruby-bundler ruby-irb ruby-bigdecimal tzdata && \
apk add nodejs && \
apk add curl-dev ruby-dev build-base libffi-dev && \
apk add build-base libxslt-dev libxml2-dev ruby-rdoc mysql-dev sqlite-dev

ENV RAILS_ROOT /app
RUN mkdir -p $RAILS_ROOT
WORKDIR $RAILS_ROOT

ENV GEM_HOME /gems
ENV BUNDLE_PATH /gems
ENV PATH $GEM_HOME/bin:$GEM_HOME/gems/bin:$PATH

COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install --jobs 20 --retry 5

COPY . ./

ENTRYPOINT ["./entrypoints/docker-entrypoint.sh"]