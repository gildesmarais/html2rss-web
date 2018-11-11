FROM ruby:2.5-stretch

LABEL maintainer="Gil Desmarais <html2rss-web-docker@desmarais.de>"

EXPOSE 3000

ENV PORT=3000
ENV RACK_ENV=production

HEALTHCHECK --interval=5m --timeout=3s --start-period=5s \
  CMD curl -f http://localhost:3000/ || exit 1

RUN mkdir /app
WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN gem install --no-ri --no-rdoc bundler
RUN bundle config --global frozen 1
RUN bundle install --binstubs --retry=5 --jobs=7 --without development test

COPY . .

CMD bundle exec foreman start
