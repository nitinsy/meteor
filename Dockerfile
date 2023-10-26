FROM registry.access.redhat.com/ubi8/nodejs-14:latest

#ENV METEOR_ALLOW_SUPERUSER=true
ENV PATH=$PATH:$HOME/.meteor

USER default

RUN curl "https://install.meteor.com/" | sh

WORKDIR /opt/app-root/src/app
RUN whoami
RUN pwd

RUN ls -la /opt/app-root/src/app

COPY --chown=default:0 . .

RUN ls -la /opt/app-root/src/app
RUN ls -la /opt/app-root/src/app/.meteor

RUN meteor npm install

USER root
RUN chmod -R 777 /opt/app-root/src/app/.meteor
RUN chown -R default:0 /opt/app-root/src/app/.meteor
USER default

RUN ls -la /opt/app-root/src/app/.meteor
RUN ls -la /opt/app-root/src/app/.meteor/local
RUN ls -la /opt/app-root/src/app/.meteor/packages

EXPOSE 3000
CMD ["npm", "start"]
