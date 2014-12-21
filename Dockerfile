FROM debian
MAINTAINER ytnobody <ytnobody@gmail.com>

RUN apt-get update
RUN apt-get install mecab mecab-ipadic-utf8 libmecab-dev perl curl git gcc make libstdc++6 libstdc++6-4.7-dev -y
RUN apt-get clean
RUN curl -L http://xrl.us/cpanm > /usr/bin/cpanm && chmod +x /usr/bin/cpanm
RUN cpanm -n Plack JSON::XS 

ENV PERL_TEXT_MECAB_ENCODING utf-8
RUN cpanm -v Text::MeCab
RUN cpanm Data::Recursive::Encode

RUN mkdir /app
ADD app.psgi /app/app.psgi

EXPOSE 7654

WORKDIR /app
ENTRYPOINT ["plackup", "-p", "7654"]
