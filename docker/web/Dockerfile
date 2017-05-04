FROM ubuntu:14.04
MAINTAINER Michael Cravero <mjcravero@gmail.com>

COPY ./docker/web/web-entrypoint.sh /
COPY ./web-client/package.json /django/web-client/package.json

WORKDIR /django/web-client

RUN apt-get update && apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
RUN echo "deb http://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update && apt-get install -y nodejs yarn