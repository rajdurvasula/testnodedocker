FROM node:latest

LABEL org.opencontainers.image.authors="raj.durvasula@gmail.com"

COPY /resources/package.json /
COPY /resources/server.js /

RUN npm install

CMD [ "node", "server.js" ]
