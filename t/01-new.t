use v6;
use Test;
use lib 'lib';
use Parse::STDF;

plan 1;
my $s = Parse::STDF.new( stdf => "t/data/test.stdf" );
ok defined($s), 'opened data/test.stdf';
