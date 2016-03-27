use v6;
use Test;
use Parse::STDF;

plan 13;
my $s = Parse::STDF.new( stdf => "t/data/test.stdf" );

while $s.get_record
{
  given ( $s.recname )
  {
    when "RDR"
    {
      ok 1, 'RDR record found in test.stdf';
      my $rdr = $s.rdr;
      ok $rdr.defined, 'RDR object defined';
      is $rdr.NUM_BINS, 10, "NUM_BINS is 10";
      my @bins = $rdr.RTST_BIN.array($rdr.NUM_BINS);
      for 0..$rdr.NUM_BINS-1 -> $i 
      {
        my $val = ($i+1)*2;
        is @bins[$i], $val, "bin[$i] is $val"; 
      }
      last;
    }
  }
}

