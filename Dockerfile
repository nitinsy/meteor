FROM registry.access.redhat.com/ubi8/nodejs-14:latest

ENV METEOR_ALLOW_SUPERUSER=true
ENV PATH=$PATH:$HOME/.meteor

RUN curl "https://install.meteor.com/" | sh

COPY . /usr/src/app
WORKDIR /usr/src/app

RUN meteor npm install

USER root
RUN chown -R 1001:0 /usr/src/app

USER 1001

EXPOSE 3000
CMD ["npm", "start"]

