FROM registry.access.redhat.com/ubi8/nodejs-18:latest

ENV METEOR_ALLOW_SUPERUSER=true
ENV ROOT_URL="http://localhost:3000"

USER 1001

RUN curl "https://install.meteor.com/" | sh

COPY  .  /usr/src/app
WORKDIR  /usr/src/app

# VOLUME ["/usr/src/app/.meteor/local"]

RUN chmod -R 700  /usr/src/app/.meteor/local
RUN meteor npm install

# VOLUME ["/opt/app-root/src/.npm/_cacache"]

EXPOSE 3000
CMD ["npm", "start"]
