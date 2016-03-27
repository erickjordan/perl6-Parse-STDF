use v6;
use Test;
use Parse::STDF;

plan 1;
my $s = Parse::STDF.new( stdf => "t/data/test.stdf" );
ok defined($s), 'New object instance created for test.stdf';
