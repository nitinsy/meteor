FROM registry.access.redhat.com/ubi8/nodejs-14:latest

#ENV METEOR_ALLOW_SUPERUSER=true
ENV ROOT_URL="http://localhost:3000"
ENV PATH=$PATH:$HOME/.meteor

RUN whoami
RUN curl "https://install.meteor.com/" | sh

RUN echo $HOME/.meteor

RUN ls -la

RUN whoami
COPY . .

RUN ls -la /opt/app-root/src
RUN ls -la /opt/app-root/src/.meteor

RUN echo $PATH
RUN chown -R default:0 /opt/app-root/src

RUN whoami
RUN which meteor

RUN whoami
RUN meteor npm install

RUN whoami
RUN ls -la /opt/app-root/src
RUN ls -la /opt/app-root/src/.meteor
RUN chmod -R 700 $HOME/.meteor/local
RUN ls -la /opt/app-root/src/.meteor

EXPOSE 3000
CMD ["npm", "start"]

