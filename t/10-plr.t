use v6;
use Test;
use Parse::STDF;

plan 15;
my $s = Parse::STDF.new( stdf => "t/data/test.stdf" );

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
      my @indx = $plr.GRP_INDX.array($plr.GRP_CNT); 
      is @indx[0], 2, "GRP_INDX[0] is 2";
      is @indx[1], 4, "GRP_INDX[1] is 4";
      is @indx[2], 6, "GRP_INDX[2] is 6";
      is @indx[3], 8, "GRP_INDX[3] is 8";
      is @indx[4], 10, "GRP_INDX[4] is 10";
      is @indx[5], 12, "GRP_INDX[5] is 12";
      my @chal = $plr.PGM_CHAL.array($plr.GRP_CNT);
      is @chal[0].cnstr, 'M', "PGM_CHAL[0] is 'M'";
      is @chal[1].cnstr, 'N', "PGM_CHAL[1] is 'N'";
      is @chal[2].cnstr, 'O', "PGM_CHAL[2] is 'O'";
      is @chal[3].cnstr, 'P', "PGM_CHAL[3] is 'P'";
      is @chal[4].cnstr, 'Q', "PGM_CHAL[4] is 'Q'";
      is @chal[5].cnstr, 'R', "PGM_CHAL[5] is 'R'";
      last;
    }
  }
}

