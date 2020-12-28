# use a node base image
FROM node:current-buster-slim

COPY package*.json ./

RUN npm install

# set maintainer
LABEL maintainer "academy@release.works"

# set a health check
HEALTHCHECK --interval=5s \
            --timeout=5s \
            CMD curl -f http://127.0.0.1:8000 || exit 1

# tell docker what port to expose
CMD [ "node", "server.js" ]

EXPOSE 8000