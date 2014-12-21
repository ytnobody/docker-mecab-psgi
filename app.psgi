use strict;
use utf8;
use JSON::XS;
use Text::MeCab;
use Plack::Request;
use Data::Recursive::Encode;

my $mecab = Text::MeCab->new;
my $json = JSON::XS->new->utf8;

sub {
    my $env = shift;
    my $req = Plack::Request->new($env);

    my @nodes;
    my $node;
    my $text = $req->param('text');

    for ($node = $mecab->parse($text); $node; $node = $node->next) {
        push @nodes, +{
            feature => [split /,/, $node->feature],
            map {($_ => $node->$_)} qw/
                id surface length rlength rcattr lcattr stat isbest alpha beta prob wcost cost
            / 
        };
    }

    [
        200,
        ['Content-Type' => 'application/json; charset=UTF-8'],
        [ $json->encode(Data::Recursive::Encode->decode_utf8({nodes => [@nodes]})) ],
    ];
};


