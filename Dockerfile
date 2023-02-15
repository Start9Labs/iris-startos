FROM node:18.13.0-bullseye

ARG ARCH

RUN apt update -yq
RUN DEBIAN_FRONTEND=noninteractive apt install -yq aptitude emacs-nox screen rsync build-essential curl git jq tini

WORKDIR /iris-messenger/
COPY iris-messenger/ .
COPY /iris-messenger/../.git/modules/iris-messenger ../.git/modules/iris-messenger

RUN yarn
RUN NODE_OPTIONS=--openssl-legacy-provider yarn build
RUN cat package.json | jq '.scripts.serve="sirv build --host iris.embassy --port 80 --cors --single"' > package.json.new && mv -vf package.json.new package.json

ADD ./docker_entrypoint.sh /usr/local/bin/docker_entrypoint.sh
RUN chmod a+x /usr/local/bin/docker_entrypoint.sh
