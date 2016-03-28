use v6;
use Test;
use Parse::STDF;

plan 15;
my $s = Parse::STDF.new( stdf => "t/data/test.stdf" );
constant @GRP_INDX = <2 4 6 8 10 12>;
constant @PGM_CHAL = <M N O P Q R>;

while $s.get_record
{
  given ( $s.recname )
  {
    when "PLR"
    {
      ok 1, 'PLR record found in test.stdf';
      my $plr = $s.plr;
      ok $plr.defined, 'PLR object defined';
      is $plr.GRP_CNT, 6, "GRP_CNT is 6";
      for $plr.GRP_INDX.array($plr.GRP_CNT).kv -> $k, $v { is @GRP_INDX[$k], $v, "GRP_INDX[$k] is $v"; }
      for $plr.PGM_CHAL.array($plr.GRP_CNT).kv -> $k, $v { is @PGM_CHAL[$k], $v.cnstr, "PGM_CHAL[$k] is " ~ $v.cnstr; }
      last;
    }
  }
}

