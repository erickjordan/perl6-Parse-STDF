use v6;
use Test;
use lib 'lib';
use Parse::STDF;

plan 1;
my $s = Parse::STDF.new( stdf => "t/data/test.stdf" );
my $rec_count = 0;
while $s.get_record { $rec_count++; }
ok $rec_count == 22, 'read 22 records from t/data/test.stdf';
