FROM ubuntu:22.04

ARG ARCH

RUN apt update -yq
RUN DEBIAN_FRONTEND=noninteractive apt install -yq aptitude emacs-nox screen rsync build-essential curl git jq
RUN DEBIAN_FRONTEND=noninteractive apt purge -yq cmdtest nodejs
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash -
RUN DEBIAN_FRONTEND=noninteractive apt install -yq nodejs
RUN npm install --global yarn

COPY . .

WORKDIR /iris-messenger/

RUN yarn
RUN NODE_OPTIONS=--openssl-legacy-provider yarn build
RUN cat package.json | jq '.scripts.serve="sirv build --host iris.embassy --port 8080 --cors --single"' > package.json.new && mv -vf package.json.new package.json

ADD ./docker_entrypoint.sh /usr/local/bin/docker_entrypoint.sh
RUN chmod a+x /usr/local/bin/docker_entrypoint.sh
