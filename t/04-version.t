use v6;
use Test;
use Parse::STDF;

plan 1;
my $s = Parse::STDF.new( stdf => "t/data/test.stdf" );
is $s.ver, 4, 'STDF version is 4';
