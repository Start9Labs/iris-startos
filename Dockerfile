FROM node:16-alpine as builder

RUN apk add --update --no-cache build-base python3 jq git\
  && rm -rf /var/cache/apk/*

WORKDIR /iris-messenger/
COPY ./iris-messenger/ .
COPY ./iris-messenger/../.git/modules/iris-messenger ../.git/modules/iris-messenger

RUN cat package.json | jq '.scripts.serve="sirv build --host iris.embassy --port 80 --cors --single"' > package.json.new \
  && mv -vf package.json.new package.json

RUN yarn && \
    yarn build

FROM nginx:1.23-alpine

#RUN apk add --update --no-cache \
#  bash \
#  curl \
#  jq \
#  nginx \
#  tini \
#  && rm -rf /var/cache/apk/*

WORKDIR /usr/share/nginx/html
COPY --from=builder /iris-messenger/build /usr/share/nginx/html
#COPY --from=builder /iris-messenger/node_modules ./node_modules
#COPY --from=builder /iris-messenger/package.json ./

ADD ./docker_entrypoint.sh /usr/local/bin/docker_entrypoint.sh
RUN chmod a+x /usr/local/bin/docker_entrypoint.sh
