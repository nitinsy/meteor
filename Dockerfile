# Dockerfile
FROM node:16.19.1

WORKDIR /usr/src/app

ENV METEOR_ALLOW_SUPERUSER=true
# ENV ROOT_URL="http://localhost:3000"

RUN curl "https://install.meteor.com/" | sh

COPY . /usr/src/app

RUN chmod -R 777 /usr/src/app/
RUN meteor npm install

EXPOSE 3000
CMD ["meteor"]