FROM registry.access.redhat.com/ubi8/nodejs-18:latest

USER root
# Install Meteor
RUN curl -L https://install.meteor.com | sh

# Add the Meteor CLI directory to the PATH environment variable
ENV export PATH="/usr/local/bin:$PATH"

# Copy the Meteor application source code
COPY . /app

# Build the Meteor application
RUN meteor build

RUN cp "/opt/app-root/src/.meteor/packages/meteor-tool/2.13.3/mt-os.linux.x86_64/scripts/admin/launch-meteor" /usr/bin/meteor

# Set the working directory to the Meteor application build directory
WORKDIR /app/build

# Expose the Meteor application port
EXPOSE 3000

# Start the Meteor application
CMD ["meteor", "run"]




# Install the application dependencies in a full UBI Node docker image
# FROM registry.access.redhat.com/ubi8/nodejs-18:latest 

# WORKDIR /project
# # Elevate privileges to run npm
# USER root

# # Copy package.json and package-lock.json
# COPY package*.json ./


# # Install app dependencies
# RUN npm install

# # Copy the dependencies into a minimal Node.js image
# # FROM registry.access.redhat.com/ubi8/nodejs-18:latest AS final

# # Install app dependencies
# # COPY --from=base /opt/app-root/src/node_modules /opt/app-root/src/node_modules
# COPY . .

# # Elevate privileges to change owner of source files
# # USER root
# RUN chown -R 1001:0 . .

# RUN curl https://install.meteor.com/ | sh

# # Restore default user privileges
# USER 1001

# # Run application in 'development' mode
# ENV NODE_ENV development

# # Listen on port 8080
# ENV PORT 3000

# # Container exposes port 8080
# EXPOSE 3000

# # Start node process
# # CMD ["pwd", "&&", "ls"]
# CMD ["meteor", "run"]
# FROM registry.access.redhat.com/ubi8/nodejs-18:latest

# # Install Meteor
# RUN curl https://install.meteor.com/ | sh

# # Create a working directory
# WORKDIR /app

# # Copy Meteor project files
# COPY . .

# RUN npm install -g meteor


# ENV PATH="${PATH}:/path/to/meteor"

# # Install Meteor project dependencies
# # RUN meteor npm install

# # Expose port 3000 for Meteor app
# EXPOSE 3000

# # Start Meteor app
# CMD ["meteor", "run"]


# # Use the UBI 8 as the base image
# FROM registry.access.redhat.com/ubi8/nodejs-18:latest

# # Set environment variables (change them as needed)
# # ENV NODE_ENV=production 
#     # ROOT_URL=http://localhost:3000 \
#     # PORT=3000

# USER root

# RUN RUN curl https://install.meteor.com/ | sh

# # Set the working directory to /app
# WORKDIR /app

# # Install Meteor CLI globally
# COPY --chown=1001:1001 package.json /app/
# RUN npm install -g meteor

# # Copy your Meteor application files to the container
# COPY --chown=1001:1001 . /app/

# # RUN curl https://install.meteor.com/ | sh

# # Install Meteor dependencies
# RUN npm install

# # Build your Meteor app (if needed)
# # RUN meteor build --directory /build

# # Expose the port your Meteor app will run on
# EXPOSE 3000

# # Run your Meteor app
# CMD ["npm", "start"]
