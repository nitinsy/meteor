FROM registry.access.redhat.com/ubi8/nodejs-18:latest

ENV METEOR_ALLOW_SUPERUSER=true
ENV ROOT_URL="http://localhost:3000"

USER root

RUN curl "https://install.meteor.com/" | sh
# COPY package.json package-lock.json ./
# RUN meteor npm install
# RUN chmod -R 777 /usr/src/app/.meteor/local
RUN chmod 777 /usr/local/bin/meteor

USER 1001 
COPY  --chown=1001:1001 package.json package-lock.json ./
RUN meteor npm install

COPY --chown=1001:1001 . /usr/src/app
# WORKDIR /usr/src/app

EXPOSE 3000
# VOLUME ["
CMD ["npm", "start"]


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
