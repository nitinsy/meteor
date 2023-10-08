# Use the UBI 8 as the base image
FROM registry.access.redhat.com/ubi8/nodejs-18:latest

# Set environment variables (change them as needed)
ENV NODE_ENV=production 
    # ROOT_URL=http://localhost:3000 \
    # PORT=3000

USER root

RUN RUN curl https://install.meteor.com/ | sh

# Set the working directory to /app
WORKDIR /app

# Install Meteor CLI globally
COPY --chown=1001:1001 package.json /app/
RUN npm install -g meteor

# Copy your Meteor application files to the container
COPY --chown=1001:1001 . /app/

RUN curl https://install.meteor.com/ | sh

# Install Meteor dependencies
RUN npm install

# Build your Meteor app (if needed)
# RUN meteor build --directory /build

# Expose the port your Meteor app will run on
EXPOSE 3000

# Run your Meteor app
CMD ["npm", "start"]
