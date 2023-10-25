FROM registry.access.redhat.com/ubi8/nodejs-14:latest

ENV METEOR_ALLOW_SUPERUSER=true
ENV ROOT_URL="http://localhost:3000"
ENV PATH=$PATH:$HOME/.meteor

RUN curl "https://install.meteor.com/" | sh

RUN echo $HOME/.meteor

RUN ls -la

COPY . .

RUN ls -la /opt/app-root/src

RUN meteor npm install

RUN ls -la /opt/app-root/src
RUN ls -la /opt/app-root/src/.meteor
RUN chmod -R 700 $HOME/.meteor/local
RUN ls -la /opt/app-root/src/.meteor

EXPOSE 3000
CMD ["npm", "start"]

