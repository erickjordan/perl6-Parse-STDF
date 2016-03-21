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
          say "SETUP_T: "   ~ $mir.SETUP_T.ctime;
          say "START_T: "   ~ $mir.START_T.ctime;
          say "STAT_NUM: "  ~ $mir.STAT_NUM;
          say "MODE_COD: "  ~ $mir.MODE_COD.chr;
          say "RTST_COD: "  ~ $mir.RTST_COD.chr;
          say "PROT_COD: "  ~ $mir.PROT_COD.chr;
          say "BURN_TIM: "  ~ $mir.BURN_TIM;
          say "CMOD_COD: "  ~ $mir.CMOD_COD.chr;
          say "LOT_ID: "    ~ $mir.LOT_ID.cnstr;
          say "PART_TYP: "  ~ $mir.PART_TYP.cnstr;
          say "NODE_NAM: "  ~ $mir.NODE_NAM.cnstr;
          say "TSTR_TYP: "  ~ $mir.TSTR_TYP.cnstr;
          say "JOB_NAM: "   ~ $mir.JOB_NAM.cnstr;
          say "JOB_REV: "   ~ $mir.JOB_REV.cnstr;
          say "SBLOT_ID: "  ~ $mir.SBLOT_ID.cnstr;
          say "OPER_NAM: "  ~ $mir.OPER_NAM.cnstr;
          say "EXEC_TYP: "  ~ $mir.EXEC_TYP.cnstr;
          say "EXEC_VER: "  ~ $mir.EXEC_VER.cnstr;
          say "TEST_COD: "  ~ $mir.TEST_COD.cnstr;
          say "TST_TEMP: "  ~ $mir.TST_TEMP.cnstr;
          say "USER_TXT: "  ~ $mir.USER_TXT.cnstr;
          say "AUX_FILE: "  ~ $mir.AUX_FILE.cnstr;
          say "PKG_TYP: "   ~ $mir.PKG_TYP.cnstr;
          say "FAMILY_ID: " ~ $mir.FAMILY_ID.cnstr;
          say "DATE_COD: "  ~ $mir.DATE_COD.cnstr;
          say "FACIL_ID: "  ~ $mir.FACIL_ID.cnstr;
          say "FLOOR_ID: "  ~ $mir.FLOOR_ID.cnstr;
          say "PROC_ID: "   ~ $mir.PROC_ID.cnstr;
          say "OPER_FRQ: "  ~ $mir.OPER_FRQ.cnstr;
          say "SPEC_NAM: "  ~ $mir.SPEC_NAM.cnstr;
          say "SPEC_VER: "  ~ $mir.SPEC_VER.cnstr;
          say "FLOW_ID: "   ~ $mir.FLOW_ID.cnstr;
          say "SETUP_ID: "  ~ $mir.SETUP_ID.cnstr;
          say "DSGN_REV: "  ~ $mir.DSGN_REV.cnstr;
          say "ENG_ID: "    ~ $mir.ENG_ID.cnstr;
          say "ROM_COD: "   ~ $mir.ROM_COD.cnstr;
          say "SERL_NUM: "  ~ $mir.SERL_NUM.cnstr;
          say "SUPR_NAM: "  ~ $mir.SUPR_NAM.cnstr;
          last;
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

