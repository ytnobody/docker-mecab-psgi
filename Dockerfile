FROM ytnobody/base:wheezy
MAINTAINER ytnobody <ytnobody@gmail.com>

RUN apt-get update && apt-get install mecab mecab-ipadic-utf8 libmecab-dev libstdc++6 libstdc++6-4.7-dev libjson-xs-perl libtext-mecab-perl -y && apt-get clean

RUN cpanm --auto-cleanup=0 -n Data::Recursive::Encode

RUN mkdir /app
ADD app.psgi /app/app.psgi

EXPOSE 7654

WORKDIR /app
ENTRYPOINT ["plackup", "-p", "7654"]
