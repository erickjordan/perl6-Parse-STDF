#!/usr/bin/env perl6
use v6;
use lib '../lib';
use Parse::STDF;

sub MAIN( Str $stdf )
{
  try
  {
    my $s = Parse::STDF.new( stdf => $stdf );
    while $s.get_record
    {
      given ( $s.recname )
      {
        when "SDR"
        {
          my $sdr = $s.sdr;
          say "HEAD_NUM: " ~ $sdr.HEAD_NUM;
          say "SITE_GRP: " ~ $sdr.SITE_GRP;
          say "SITE_CNT: " ~ $sdr.SITE_CNT;
          say "SITE_NUM: " ~ $sdr.SITE_NUM.array($sdr.SITE_CNT);
          say "HAND_TYP: " ~ $sdr.HAND_TYP.cnstr;
          say "HAND_ID: "  ~ $sdr.HAND_ID.cnstr;
          say "CARD_TYP: " ~ $sdr.CARD_TYP.cnstr;
          say "CARD_ID: "  ~ $sdr.CARD_ID.cnstr;
          say "LOAD_TYP: " ~ $sdr.LOAD_TYP.cnstr;
          say "LOAD_ID: "  ~ $sdr.LOAD_ID.cnstr;
          say "DIB_TYP: "  ~ $sdr.DIB_TYP.cnstr;
          say "DIB_ID: "   ~ $sdr.DIB_ID.cnstr;
          say "CABL_TYP: " ~ $sdr.CABL_TYP.cnstr;
          say "CABL_ID: "  ~ $sdr.CABL_ID.cnstr;
          say "CONT_TYP: " ~ $sdr.CONT_TYP.cnstr;
          say "CONT_ID: "  ~ $sdr.CONT_ID.cnstr;
          say "LASR_TYP: " ~ $sdr.LASR_TYP.cnstr;
          say "LASR_ID: "  ~ $sdr.LASR_ID.cnstr;
          say "EXTR_TYP: " ~ $sdr.EXTR_TYP.cnstr;
          say "EXTR_ID: "  ~ $sdr.EXTR_ID.cnstr;
        }
        default {}
      }
    }
    CATCH
    {
      when Parse::STDF::E { say $_.message; }
      default { say $_; }
    }
  }
}

