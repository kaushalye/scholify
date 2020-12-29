#base
FROM ruby:2.2.1

ENV HOME /home/rails/webapp

RUN apt-get update -qq && apt-get install -y build-essential nodejs npm nodejs-legacy mysql-client vim

WORKDIR $HOME

ADD Gemfile* $HOME/
RUN bundle install

#application code
ADD . $HOME

#run
CMD ["rails", "server", "--binding", "0.0.0.0"]