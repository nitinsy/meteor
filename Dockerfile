# Dockerfile
FROM node:6.9

WORKDIR /usr/src/app

COPY . .

ENV METEOR_ALLOW_SUPERUSER=true
# ENV ROOT_URL="http://localhost:3000"

RUN curl "https://install.meteor.com/" | sh

# Install dependencies
RUN meteor npm install

# Build your Meteor.js app (you may need to specify the production flag if needed)
RUN meteor build --directory /build

# Change to the build directory
WORKDIR /build/bundle

# Expose a port (default Meteor.js port is 3000)
EXPOSE 3000

CMD ["meteor"]