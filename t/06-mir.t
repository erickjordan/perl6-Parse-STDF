use v6;
use Test;
use lib 'lib';
use Parse::STDF;

plan 3;
my $s = Parse::STDF.new( stdf => "t/data/test.stdf" );

while $s.get_record
{
  given ( $s.recname )
  {
    when "MIR"
    {
      ok 1, 'MIR record found in test.stdf';
      my $mir = $s.mir;
      ok $mir.defined, 'MIR object defined';
      ok $mir.LOT_ID.cnstr eq "LOT_ID" , "LOT_ID eq 'LOT_ID'";
      last;
    }
  }
}

