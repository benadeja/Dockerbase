FROM ubuntu:latest
MAINTAINER jaco.benade@gmail.com

RUN apt-get update
RUN apt-get install -y curl

RUN curl --silent --location https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install --yes nodejs
RUN apt-get clean

RUN mkdir src/
WORKDIR src/

CMD ["npm", "start"]

ONBUILD COPY ./package.json ./
ONBUILD RUN npm install
ONBUILD COPY . .
