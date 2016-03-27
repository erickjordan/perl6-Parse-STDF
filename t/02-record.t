use v6;
use Test;
use Parse::STDF;

plan 1;
my $s = Parse::STDF.new( stdf => "t/data/test.stdf" );
my $rec_count = 0;
while $s.get_record { $rec_count++; }
is $rec_count, 22, 'Read 22 records from test.stdf';
