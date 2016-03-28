use v6;
use Test;
use Parse::STDF;

plan 3;
my $s = Parse::STDF.new( stdf => "t/data/test.stdf" );

while $s.get_record
{
  given ( $s.recname )
  {
    when "PCR"
    {
      ok 1, 'PCR record found in test.stdf';
      my $pcr = $s.pcr;
      ok $pcr.defined, 'PCR object defined';
      is $pcr.HEAD_NUM, -1, "HEAD_NUM is -1"; # BUG: #127144
      last;
    }
  }
}

