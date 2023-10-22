FROM registry.access.redhat.com/ubi8/nodejs-18:latest

ENV METEOR_ALLOW_SUPERUSER=true
ENV ROOT_URL="http://localhost:3000"

USER root

RUN curl "https://install.meteor.com/" | sh

COPY  .  /opt/app-root/app
WORKDIR  /opt/app-rootc/app

RUN chmod -R 700  /opt/app-root/app/.meteor/local
RUN meteor npm install

EXPOSE 3000
CMD ["npm", "start"]
