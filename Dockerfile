FROM registry.access.redhat.com/ubi8/nodejs-18:latest

# Set the working directory
WORKDIR /app

# Copy the Meteor app source code to the container
COPY --chown=1001:1001 . .

ENV PATH=$PATH:$HOME/.meteor

# Install Meteor
RUN curl https://install.meteor.com/ | sh


# Build the Meteor app
RUN meteor npm install

RUN  npm cache clean --force 

VOLUME ["/usr/src/app/.npm/"]

USER root
RUN chmod 777 /app/.meteor/local/
RUN chmod -R 777 /usr/src/app/.npm/
USER 1001 
EXPOSE 3000

CMD ["npm", "start"]




# FROM registry.access.redhat.com/ubi8/nodejs-18:latest

# ENV METEOR_ALLOW_SUPERUSER=true
# ENV ROOT_URL="http://localhost:3000"
# ENV NPM_CONFIG_CACHE=/opt/app-root/src/.npm

# USER root

# RUN curl "https://install.meteor.com/" | sh
# RUN chmod 777 /usr/local/bin/meteor

# # RUN  npm cache clean --force 
# # RUN chown -R 1001:1001 /opt/app-root/src/.npm

# USER 1001 

# COPY  --chown=1001:1001 package.json package-lock.json ./

# COPY --chown=1001:1001 . /usr/src/app

# RUN meteor npm install

# USER root
# RUN  npm cache clean --force 
# USER 1001

# EXPOSE 3000

# CMD ["npm", "start"]


# FROM registry.access.redhat.com/ubi8/nodejs-18:latest

# ENV METEOR_ALLOW_SUPERUSER=true
# ENV ROOT_URL="http://localhost:3000"

# USER root

# RUN curl "https://install.meteor.com/" | sh

# WORKDIR /usr/src/app

# COPY --chown=1001:1001 . /usr/src/app

# VOLUME ["/usr/src/app/.meteor/local"]

# RUN chmod -R 700 "/usr/src/app/.meteor/local"
# RUN meteor npm install

# # RUN chown -R 1007790000:0 "/opt/app-root/src/.npm"

# EXPOSE 3000
# CMD ["npm", "start"]
