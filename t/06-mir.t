use v6;
use Test;
use Parse::STDF;

plan 7;
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
      is $mir.LOT_ID.cnstr, "LOT_ID", "LOT_ID is LOT_ID";
      is $mir.SETUP_T.ctime, "Wed Dec 31 16:00:01 1969", "SETUP_T is Wed Dec 31 16:00:01 1969";
      is $mir.START_T.ctime, "Wed Dec 31 16:00:01 1969", "START_T is Wed Dec 31 16:00:01 1969";
      is $mir.STAT_NUM, 2, "STAT_NUM is 2";
      is $mir.BURN_TIM, -1, "BURN_TIM is -1"; # BUG: #127144
      last;
    }
  }
}

