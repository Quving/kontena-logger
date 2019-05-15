FROM ruby:2.5.1

# Install node LTS
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    apt-get install -y nodejs

RUN gem install kontena-cli
RUN npm install -g frontail

WORKDIR /app
ADD entrypoint.rb .

CMD ["ruby", "entrypoint.rb"]
