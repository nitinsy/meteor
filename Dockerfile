FROM registry.access.redhat.com/ubi8/nodejs-14:latest

ENV METEOR_ALLOW_SUPERUSER=true
ENV PATH=$PATH:$HOME/.meteor

RUN curl "https://install.meteor.com/" | sh

COPY --chown=1001:1001 . /usr/src/app
WORKDIR /usr/src/app

RUN meteor npm install

EXPOSE 3000
CMD ["npm", "start"]

