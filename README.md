# ytnobody/mecab-psgi

MeCab API Server on PSGI + Docker

## SYNOPSIS

    $ make build run

## API [GET /]

Parse specified text and return thair nodes in JSON response.

### PARAM

- text - parse target text

## EXAMPLE

request 

    http://localhost:5000/?text=%E3%81%99%E3%82%82%E3%82%82%E3%82%82%E3%82%82%E3%82%82%E3%82%82%E3%82%82%E3%82%82%E3%81%AE%E3%81%86%E3%81%A1

response

    {"nodes":
      [
        {
          "surface":"すもも","rlength":"9","cost":"7263","isbest":"1","beta":"0","wcost":"7546","stat":"0",
          "feature":["名詞","一般","*","*","*","*","すもも","スモモ","スモモ"],
          "length":"9","rcattr":"1285","alpha":"0","prob":"0","id":"9","lcattr":"1285"
        },
        {
          "surface":"も","rlength":"3","cost":"7774","isbest":"1","beta":"0","wcost":"4669","stat":"0",
          "feature":["助詞","係助詞","*","*","*","*","も","モ","モ"],
          "length":"3","rcattr":"262","alpha":"0","prob":"0","id":"19","lcattr":"262"
        },
        {
          "surface":"もも","rlength":"6","cost":"15010","isbest":"1","beta":"0","wcost":"7219","stat":"0",
          "feature":["名詞","一般","*","*","*","*","もも","モモ","モモ"],
          "length":"6","rcattr":"1285","alpha":"0","prob":"0","id":"25","lcattr":"1285"
        },
        {
          "surface":"も","rlength":"3","cost":"15521","isbest":"1","beta":"0","wcost":"4669","stat":"0",
          "feature":["助詞","係助詞","*","*","*","*","も","モ","モ"],
          "length":"3","rcattr":"262","alpha":"0","prob":"0","id":"31","lcattr":"262"
        },
        {
          "surface":"もも","rlength":"6","cost":"22757","isbest":"1","beta":"0","wcost":"7219","stat":"0",
          "feature":["名詞","一般","*","*","*","*","もも","モモ","モモ"],
          "length":"6","rcattr":"1285","alpha":"0","prob":"0","id":"37","lcattr":"1285"
        },
        {
          "surface":"の","rlength":"3","cost":"23131","isbest":"1","beta":"0","wcost":"4816","stat":"0",
          "feature":["助詞","連体化","*","*","*","*","の","ノ","ノ"],
          "length":"3","rcattr":"368","alpha":"0","prob":"0","id":"46","lcattr":"368"
        },
        {
          "surface":"うち","rlength":"6","cost":"23729","isbest":"1","beta":"0","wcost":"5796","stat":"0",
          "feature":["名詞","非自立","副詞可能","*","*","*","うち","ウチ","ウチ"],
          "length":"6","rcattr":"1313","alpha":"0","prob":"0","id":"56","lcattr":"1313"
        },
        {
          "surface":null,"rlength":"0","cost":"21245","isbest":"1","beta":"0","wcost":"0","stat":"3",
          "feature":["BOS/EOS","*","*","*","*","*","*","*","*"],
          "length":"0","rcattr":"0","alpha":"0","prob":"0","id":"62","lcattr":"0"
        }
      ]
    }


