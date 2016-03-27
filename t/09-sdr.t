use v6;
use Test;
use Parse::STDF;

plan 7;
my $s = Parse::STDF.new( stdf => "t/data/test.stdf" );

while $s.get_record
{
  given ( $s.recname )
  {
    when "SDR"
    {
      ok 1, 'SDR record found in test.stdf';
      my $sdr = $s.sdr;
      ok $sdr.defined, 'SDR object defined';
      is $sdr.SITE_CNT, 4, "SITE_CNT is 4";
      my @sites = $sdr.SITE_NUM.array($sdr.SITE_CNT);
      is @sites[0], 5,  "sites[0] is 5"; 
      is @sites[1], 10, "sites[1] is 10"; 
      is @sites[2], 15, "sites[2] is 15"; 
      is @sites[3], 20, "sites[3] is 20"; 
      last;
    }
  }
}

