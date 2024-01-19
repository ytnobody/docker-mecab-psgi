FROM debian:bookworm-slim

RUN apt-get update && apt-get install perl curl make gcc git libplack-perl -y && apt-get clean
RUN curl -L http://xrl.us/cpanm > /usr/bin/cpanm && chmod +x /usr/bin/cpanm
RUN rm -f /etc/localtime && ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

RUN apt-get update
RUN apt-get install build-essential mecab mecab-ipadic-utf8 libmecab-dev -y
RUN apt-get clean

RUN mkdir /app

COPY app.psgi /app/app.psgi
COPY cpanfile /app/cpanfile

WORKDIR /app
RUN cpanm -n --installdeps .

ARG PORT=5000

EXPOSE ${PORT}

ENTRYPOINT plackup -p ${PORT} app.psgi