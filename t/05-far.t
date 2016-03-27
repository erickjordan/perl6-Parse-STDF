use v6;
use Test;
use Parse::STDF;

plan 3;
my $s = Parse::STDF.new( stdf => "t/data/test.stdf" );
$s.get_record;
is $s.recname, "FAR", 'FAR record found in test.stdf';
my $far = $s.far;
ok $far.defined, 'FAR object defined';
is $far.CPU_TYPE, 2, 'CPU_TYPE == 2';
