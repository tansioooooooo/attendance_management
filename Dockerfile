FROM ruby:3.1.2

WORKDIR /app

RUN apt-get update -y -qq && \
    apt-get install -y -qq \
      curl \
      git-core \
      build-essential \
      libmagickwand-dev \
      nodejs \
      && \
    rm -rf /var/lib/apt/lists/*

# install nodejs(LTS)
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - && apt-get install -y nodejs

# install yarn
RUN npm install --global yarn

# gem
COPY Gemfile* /app/
RUN bundle install

COPY . /app/

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]