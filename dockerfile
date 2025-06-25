FROM ruby:3.2.2

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client libyaml-dev

WORKDIR /myapp

COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

RUN bundle install

COPY . /myapp

COPY wait-for-db.sh /myapp/wait-for-db.sh
RUN chmod +x /myapp/wait-for-db.sh

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
