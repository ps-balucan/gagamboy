# syntax=docker/dockerfile:1
FROM ruby:3.1.0
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /gagamboy
COPY Gemfile /gagamboy/Gemfile
COPY Gemfile.lock /gagamboy/Gemfile.lock
RUN bundle install


EXPOSE 3000
COPY . .


# Configure the main process to run when running the image
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]