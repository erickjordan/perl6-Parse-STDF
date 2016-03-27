use v6;
use Test;
use lib 'lib';
use Parse::STDF;

plan 5;
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
      is $mir.LOT_ID.cnstr, "LOT_ID", "LOT_ID eq 'LOT_ID'";
      is $mir.START_T.ctime, "Wed Dec 31 16:00:01 1969", "START_T eq 'Wed Dec 31 16:00:01 1969'";
      is $mir.STAT_NUM, 2, "STAT_NUM == 2";
      last;
    }
  }
}

