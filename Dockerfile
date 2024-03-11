ARG RUBY_VERSION=ruby:3.2.3
ARG NODE_VERSION=20

FROM $RUBY_VERSION
ARG NODE_VERSION

# コンテナレベルでの環境設定
ENV LANG C.UTF-8
ENV TZ Asia/Tokyo

# Node.jsのセットアップスクリプトの実行&最新パッケージを取得・ログ冗長化防止 
RUN curl -sL https://deb.nodesource.com/setup_${NODE_VERSION}.x | bash - \
    && apt-get update -qq \
    && apt-get install -y build-essential nodejs vim

WORKDIR /myapp

COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
COPY package.json /myapp/package.json
COPY package-lock.json /myapp/package-lock.json

RUN gem install bundler
RUN bundle install
RUN npm install

COPY . /myapp

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

CMD ["rails", "server", "-b", "0.0.0.0"]

