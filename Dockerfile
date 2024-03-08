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

RUN mkdir /app
WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
COPY package.json /app/package.json
COPY package-lock.json /app/package-lock.json

RUN gem install bundler
RUN bundle install
RUN npm install

COPY . /app

CMD ["rails", "server", "-b", "0.0.0.0"]
