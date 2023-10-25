FROM registry.access.redhat.com/ubi8/nodejs-14:latest

ENV METEOR_ALLOW_SUPERUSER=true
ENV ROOT_URL="http://localhost:3000"

RUN whoami
RUN pwd
RUN ls -la

RUN curl "https://install.meteor.com/" | sh

RUN echo $HOME/.meteor
RUN pwd
RUN whoami
RUN ls -la

RUN ls -la /opt/app-root/src

COPY . /opt/app-root/src
WORKDIR /opt/app-root/src

RUN chmod -R 700 /opt/app-root/src/.meteor/local
RUN meteor npm install

EXPOSE 3000
CMD ["npm", "start"]

