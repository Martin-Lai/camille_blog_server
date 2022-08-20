FROM ruby:2.7.6 as base
WORKDIR /home/app/www/blog-server
COPY . .
RUN gem install bundler
RUN bundle update --bundler
RUN bundle install
RUN apt-get update && apt-get install nano
EXPOSE 3000

# RUN bin/rake db:migrate
CMD ["rails", "server", "-b", "0.0.0.0"]