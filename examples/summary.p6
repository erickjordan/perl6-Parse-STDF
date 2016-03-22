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
          printf("Started At: %s\n", $mir.START_T.ctime);
          printf("Station Number: %d\n", $mir.STAT_NUM);
          printf("Station Mode: %s\n", $mir.MODE_COD.chr);
          printf("Retst_Code: %s\n", $mir.RTST_COD.chr);
          printf("Lot: %s\n", $mir.LOT_ID.cnstr);
          printf("Part Type: %s\n", $mir.PART_TYP.cnstr);
          printf("Node Name: %s\n", $mir.NODE_NAM.cnstr);
          printf("Tester Type: %s\n", $mir.TSTR_TYP.cnstr);
          printf("Program: %s\n", $mir.JOB_NAM.cnstr); 
          printf("Version: %s\n", $mir.JOB_REV.cnstr);
          printf("Sublot: %s\n", $mir.SBLOT_ID.cnstr);
          printf("Operator: %s\n", $mir.OPER_NAM.cnstr);
          printf("Executive: %s\n", $mir.EXEC_TYP.cnstr);
          printf("Test Code: %s\n", $mir.TEST_COD.cnstr);
          printf("Test Temperature: %s\n", $mir.TST_TEMP.cnstr);
          printf("Package Type: %s\n", $mir.PKG_TYP.cnstr);
          printf("Facility ID: %s\n", $mir.FACIL_ID.cnstr);
          printf("Design Revision: %s\n", $mir.DSGN_REV.cnstr);
          printf("Flow ID: %s\n", $mir.FLOW_ID.cnstr);
        }
        when "SDR"
        {
          my $sdr = $s.sdr;
          printf("Head: %d\n", $sdr.HEAD_NUM);
          printf("Site Count: %d\n", $sdr.SITE_CNT);
          print "Active Sites: ", $sdr.SITE_NUM.array($sdr.SITE_CNT), "\n";
          printf("Handler/Prober: %s\n", $sdr.HAND_TYP.cnstr);
          printf("DIB Type: %s\n", $sdr.DIB_TYP.cnstr);
          printf("DIB_ID: %s\n", $sdr.DIB_ID.cnstr);
        }
        when "MRR"
        {
          my $mrr = $s.mrr;
          printf("Finished At: %s\n", $mrr.FINISH_T.ctime);
        }
        when "PCR"
        {
          my $pcr = $s.pcr;
          if ( $pcr.HEAD_NUM == -1 ) # BUG: should say 255, but nativecall (or p6) says this is negative 
          {
            printf("Total bin1 count: %d\n", $pcr.GOOD_CNT);
            printf("Total number of parts binned: %d\n", $pcr.PART_CNT);
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

