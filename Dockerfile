FROM ytnobody/debian-plack
MAINTAINER ytnobody <ytnobody@gmail.com>

RUN apt-get update
RUN apt-get install mecab mecab-ipadic-utf8 libmecab-dev libstdc++6 libstdc++6-4.7-dev libjson-xs-perl -y
RUN apt-get clean

ENV PERL_TEXT_MECAB_ENCODING utf-8
RUN cpanm Text::MeCab Data::Recursive::Encode

RUN mkdir /app
ADD app.psgi /app/app.psgi

EXPOSE 7654

WORKDIR /app
ENTRYPOINT ["plackup", "-p", "7654"]
