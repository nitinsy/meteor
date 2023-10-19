FROM registry.access.redhat.com/ubi8/nodejs-18:latest

# USER root

ENV PATH=$PATH:$HOME/.meteor

RUN curl -sL https://install.meteor.com | sh

USER root

RUN cp "/opt/app-root/src/.meteor/packages/meteor-tool/2.13.3/mt-os.linux.x86_64/scripts/admin/launch-meteor" /usr/bin/meteor

# USER 1001

# RUN chmod +x /opt/app-root/src/.meteor/meteor

COPY  package.json package-lock.json ./

RUN meteor npm install --production
# RUN meteor build
#
RUN chmod 777 /opt/app-root/src/.meteor/meteor

COPY . .

# USER 1001

CMD ["which", "meteor"]


# FROM registry.access.redhat.com/ubi8/nodejs-18:latest

# ENV METEOR_ALLOW_SUPERUSER=1

# RUN curl -sL https://install.meteor.com | sh

# WORKDIR /app
# COPY  --chown=1001:1001 . .

# # RUN meteor npm install

# # USER root

# # RUN meteor build --directory . --server-only

# WORKDIR /app/bundle/programs/server
# RUN npm install

# ENV PORT=3000

# VOLUME ["/.npm/_logs"]
# VOLUME ["//.meteor-install-tmp"]

# CMD ["npm", "start"]

# FROM registry.access.redhat.com/ubi8/nodejs-18:latest

# # USER root
# # Install Meteor
# ENV METEOR_ALLOW_SUPERUSER=1
# RUN curl -L https://install.meteor.com | /bin/sh

# # Add the Meteor CLI directory to the PATH environment variable
# # ENV export PATH="/usr/local/bin:$PATH"

# ENV PATH=$PATH:/root/.meteor


# # Copy the Meteor application source code
# COPY . /app

# # Build the Meteor application
# RUN npm install

# # RUN cp "/opt/app-root/src/.meteor/packages/meteor-tool/2.13.3/mt-os.linux.x86_64/scripts/admin/launch-meteor" /usr/bin/meteor

# # Set the working directory to the Meteor application build directory
# # WORKDIR /app/build

# # Expose the Meteor application port
# EXPOSE 3000

# # Start the Meteor application
# CMD ["meteor", "run"]




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


# FROM registry.access.redhat.com/ubi8/nodejs-18:latest

# RUN curl -L https://install.meteor.com | /bin/sh
 
# # Copy package.json and package-lock.json
# COPY --chown=1001:1001 package*.json ./

# # Install npm production packages 
# RUN npm install

# COPY . /opt/app-root/src

# ENV NODE_ENV production
# ENV PORT 3000

# EXPOSE 3000

# CMD ["npm", "start"]

# Dockerfile
# FROM node:latest

# ENV METEOR_ALLOW_SUPERUSER=true
# ENV ROOT_URL="http://localhost:3000"

# RUN curl https://install.meteor.com/ -k | sh

# COPY . /usr/src/app
# WORKDIR /usr/src/app

# RUN chmod -R 700 /usr/src/app/.meteor/local
# RUN meteor npm install

# EXPOSE 3000
# CMD ["npm", "start"]
