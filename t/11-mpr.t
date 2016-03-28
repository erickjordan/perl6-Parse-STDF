use v6;
use Test;
use Parse::STDF;

plan 40;
my $s = Parse::STDF.new( stdf => "t/data/test.stdf" );

while $s.get_record
{
  given ( $s.recname )
  {
    when "MPR"
    {
      ok 1, 'MPR record found in test.stdf';
      my $mpr = $s.mpr;
      ok $mpr.defined, 'MPR object defined';
      is $mpr.RTN_ICNT, 15, "RTN_ICNT is 15";
      my @rtn_stat = $mpr.RTN_STAT.array($mpr.RTN_ICNT); 
      is @rtn_stat[0], 10, "RTN_STAT[0] is 10";
      is @rtn_stat[1], 11, "RTN_STAT[1] is 11";
      is @rtn_stat[2], 12, "RTN_STAT[2] is 12";
      is @rtn_stat[3], 13, "RTN_STAT[3] is 13";
      is @rtn_stat[4], 14, "RTN_STAT[4] is 14";
      is @rtn_stat[5], 15, "RTN_STAT[5] is 15";
      is @rtn_stat[6], 1, "RTN_STAT[6] is 1";
      is @rtn_stat[7], 2, "RTN_STAT[7] is 2";
      is @rtn_stat[8], 3, "RTN_STAT[8] is 3";
      is @rtn_stat[9], 4, "RTN_STAT[9] is 4";
      is @rtn_stat[10], 5, "RTN_STAT[10] is 5";
      is @rtn_stat[11], 6, "RTN_STAT[11] is 6";
      is @rtn_stat[12], 7, "RTN_STAT[12] is 7";
      is @rtn_stat[13], 8, "RTN_STAT[13] is 8";
      is @rtn_stat[14], 9, "RTN_STAT[14] is 9";
      is $mpr.RSLT_CNT, 6, "RSLT_CNT is 6";
      my @rtn_rslt = $mpr.RTN_RSLT.array($mpr.RSLT_CNT); 
      is-approx @rtn_rslt[0], 1.2, "RTN_RSLT[0] is 1.2";
      is-approx @rtn_rslt[1], 2.3, "RTN_RSLT[1] is 2.3";
      is-approx @rtn_rslt[2], 3.4, "RTN_RSLT[2] is 3.4";
      is-approx @rtn_rslt[3], 4.5, "RTN_RSLT[3] is 4.5";
      is-approx @rtn_rslt[4], 5.6, "RTN_RSLT[4] is 5.6";
      is-approx @rtn_rslt[5], 6.7, "RTN_RSLT[5] is 6.7";
      my @rtn_indx = $mpr.RTN_INDX.array($mpr.RTN_ICNT); 
      is @rtn_indx[0], 1, "RTN_INDX[0] is 1";
      is @rtn_indx[1], 3, "RTN_INDX[1] is 3";
      is @rtn_indx[2], 5, "RTN_INDX[2] is 5";
      is @rtn_indx[3], 7, "RTN_INDX[3] is 7";
      is @rtn_indx[4], 9, "RTN_INDX[4] is 9";
      is @rtn_indx[5], 11, "RTN_INDX[5] is 11";
      is @rtn_indx[6], 13, "RTN_INDX[6] is 13";
      is @rtn_indx[7], 15, "RTN_INDX[7] is 15";
      is @rtn_indx[8], 17, "RTN_INDX[8] is 17";
      is @rtn_indx[9], 19, "RTN_INDX[9] is 19";
      is @rtn_indx[10], 21, "RTN_INDX[10] is 21";
      is @rtn_indx[11], 23, "RTN_INDX[11] is 23";
      is @rtn_indx[12], 25, "RTN_INDX[12] is 25";
      is @rtn_indx[13], 27, "RTN_INDX[13] is 27";
      is @rtn_indx[14], 29, "RTN_INDX[14] is 29";
      last;
    }
  }
}

