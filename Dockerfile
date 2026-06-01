FROM node:22-alpine

USER root

RUN apk add --no-cache ffmpeg tini bash

RUN npm install -g n8n

USER node

WORKDIR /home/node

EXPOSE 5678

ENTRYPOINT ["tini", "--"]
CMD ["n8n", "start"]
