FROM registry.access.redhat.com/ubi8/nodejs-14:latest

#ENV METEOR_ALLOW_SUPERUSER=true
ENV PATH=$PATH:$HOME/.meteor

RUN curl "https://install.meteor.com/" | sh

RUN which meteor 
RUN ls -la /opt/app-root/src
RUN ls -la /opt/app-root/src/.meteor
RUN ls -la /opt/app-root/src/.meteor/packages

WORKDIR /opt/app-root/src/app
RUN pwd
COPY . .
COPY --chown=default:0 --chmod=775 . .

RUN ls -la /opt/app-root/src/app
RUN ls -la /opt/app-root/src/app/.meteor

RUN meteor npm install

USER root
RUN chmod -R 775 /opt/app-root/src/app/.meteor
USER default

RUN ls -la /opt/app-root/src/app/.meteor
RUN ls -la /opt/app-root/src/app/.meteor/local

EXPOSE 3000
CMD ["npm", "start"]

