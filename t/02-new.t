use v6;
use Test;
use lib 'lib';
use Parse::STDF;

plan 1;
note 'Testing Parse::STDF.new';
my $s = Parse::STDF.new( stdf => "t/data/test.stdf" );
ok defined($s), 'opened data/test.stdf';
