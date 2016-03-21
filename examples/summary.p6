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
        when "MIR"
        {
          my $mir = $s.mir; 
          say "Started At: "   ~ $mir.START_T.ctime;
          say "Station Number: "  ~ $mir.STAT_NUM;
          say "Station Mode: "  ~ $mir.MODE_COD.chr;
          say "Retst_Code: "  ~ $mir.RTST_COD.chr;
          say "Lot: "    ~ $mir.LOT_ID.cnstr;
          say "Part Type: "  ~ $mir.PART_TYP.cnstr;
          say "Node Name: "  ~ $mir.NODE_NAM.cnstr;
          say "Tester Type: "  ~ $mir.TSTR_TYP.cnstr;
          say "Program: "   ~ $mir.JOB_NAM.cnstr; 
          say "Version: "   ~ $mir.JOB_REV.cnstr;
          say "Sublot: "  ~ $mir.SBLOT_ID.cnstr;
          say "Operator: "  ~ $mir.OPER_NAM.cnstr;
          say "Executive: "  ~ $mir.EXEC_TYP.cnstr;
          say "Test Code: "  ~ $mir.TEST_COD.cnstr;
          say "Test Temperature: "  ~ $mir.TST_TEMP.cnstr;
          say "Package Type: "   ~ $mir.PKG_TYP.cnstr;
          say "Facility ID: "  ~ $mir.FACIL_ID.cnstr;
          say "Design Revision: "  ~ $mir.DSGN_REV.cnstr;
          say "Flow ID: "  ~ $mir.FLOW_ID.cnstr;
        }
        when "SDR"
        {
          my $sdr = $s.sdr;
          say "Head: " ~ $sdr.HEAD_NUM;
          say "Site Count: " ~ $sdr.SITE_CNT;
          say "Active Sites: " ~ $sdr.SITE_NUM.array($sdr.SITE_CNT);
          say "Handler/Prober: " ~ $sdr.HAND_TYP.cnstr;
          say "DIB Type: " ~ $sdr.DIB_TYP.cnstr;
          say "DIB_ID: " ~ $sdr.DIB_ID.cnstr;
        }
        when "MRR"
        {
          my $mrr = $s.mrr;
          say "Finished At: " ~ $mrr.FINISH_T.ctime;
        }
        when "PCR"
        {
          my $pcr = $s.pcr;
          if ( $pcr.HEAD_NUM == -1 ) # BUG: should say 255, but nativecall (or p6) says this is negative 
          {
            say "Total bin1 count: " ~ $pcr.GOOD_CNT;
            say "Total number of parts binned: " ~ $pcr.PART_CNT;
          }
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

