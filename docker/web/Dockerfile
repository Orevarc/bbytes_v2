# Dockerfile
FROM node:6

# Create app directory
RUN mkdir -p /usr/src/bbytes_client
WORKDIR /usr/src/bbytes_client

# Install app dependencies
ENV NODE_ENV development
COPY ./docker/web/web-entrypoint.sh /
COPY ./bbytes_client/package.json /usr/src/bbytes_client/
RUN npm install

# Bundle app source
COPY ./bbytes_client/ /usr/src/bbytes_client

EXPOSE 3000

# defined in package.json
CMD [ "npm", "run", "start" ]