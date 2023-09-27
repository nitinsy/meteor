# Use an official Node.js runtime as the base image with Node.js 16.14
FROM node:16.14

# Set the working directory in the container
WORKDIR /usr/src/app

# Install Meteor.js
RUN curl https://install.meteor.com/ | sh

# Copy your Meteor.js application into the container
COPY . .

# Install dependencies
RUN meteor npm install

# Build your Meteor.js app (you may need to specify the production flag if needed)
RUN meteor build --directory /build

# Change to the build directory
WORKDIR /build/bundle

# Expose a port (default Meteor.js port is 3000)
EXPOSE 3000

# Run your Meteor.js app (you may need to adjust this command depending on your app)
CMD ["node", "main.js"]

# # Dockerfile
# FROM node:16.19.1

# WORKDIR /usr/src/app

# ENV METEOR_ALLOW_SUPERUSER=true
# # ENV ROOT_URL="http://localhost:3000"

# RUN curl "https://install.meteor.com/" | sh

# COPY . /usr/src/app

# RUN chmod -R 777 /usr/src/app/
# RUN chmod -R 777 /usr/local/bin/meteor
# RUN meteor npm install

# EXPOSE 3000
# CMD ["meteor"]