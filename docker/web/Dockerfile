# Dockerfile
FROM node:6

RUN npm install webpack -g

WORKDIR /tmp
COPY ./bbytes_client/package.json /tmp
RUN npm config set registry http://registry.npmjs.org/ && npm install

# Create app directory
RUN mkdir -p /usr/src/bbytes_client
WORKDIR /usr/src/bbytes_client

# Install app dependencies
ENV NODE_ENV development
COPY ./bbytes_client/ /usr/src/bbytes_client/
RUN cp -a /tmp/node_modules /usr/src/bbytes_client/
RUN webpack --config webpack.dev.config.js
COPY ./docker/web/web-entrypoint.sh /

# defined in package.json
CMD [ "npm", "run", "dev-build" ]