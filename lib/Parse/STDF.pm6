use v6;

use NativeCall;
use Parse::STDF::Native;

unit class Parse::STDF;

class E is Exception
{ 
  has $.payload;
  method message() { "ERROR: $.payload" };
}

has $.stdf;
has $!f = stdf_open($!stdf) || die E.new(payload => "unable to open $!stdf");
has $!rec;
has $.recname;
has $.header;

method new(:$stdf)
{
  ( $stdf.IO.e ) || die Parse::STDF::E.new(payload => "$stdf not found");
  self.bless(:$stdf);
}

submethod DESTROY
{
  stdf_close($!f) if ( $!f.defined );
}

method get_record
{
  # Free previous record if defined
  stdf_free_record($!rec) if ( $!rec.defined );
  $!rec = stdf_read_record($!f);
  if ( $!rec.defined )
  {
    $!header = $!rec.deref.header;
    $!recname = stdf_get_rec_name($!header.REC_TYP, $!header.REC_SUB);
  }
  return ($!rec.defined);
}

method ver
{
  stdf_get_setting($!f,STDF_SETTING_VERSION, my uint32 $ver);
  return ( $ver );
}

method mir { return ( nativecast(Pointer[rec_mir],$!rec).deref ); }
method dtr { return ( nativecast(Pointer[rec_dtr],$!rec).deref ); }
method sdr { return ( nativecast(Pointer[rec_sdr],$!rec).deref ); }
method pcr { return ( nativecast(Pointer[rec_pcr],$!rec).deref ); }
method mrr { return ( nativecast(Pointer[rec_mrr],$!rec).deref ); }
method prr { return ( nativecast(Pointer[rec_prr],$!rec).deref ); }
method ptr { return ( nativecast(Pointer[rec_ptr],$!rec).deref ); }
method pir { return ( nativecast(Pointer[rec_pir],$!rec).deref ); }
method wir { return ( nativecast(Pointer[rec_wir],$!rec).deref ); }
method far { return ( nativecast(Pointer[rec_far],$!rec).deref ); }
method gdr { return ( nativecast(Pointer[rec_gdr],$!rec).deref ); }
method atr { return ( nativecast(Pointer[rec_atr],$!rec).deref ); }
method hbr { return ( nativecast(Pointer[rec_hbr],$!rec).deref ); }
method sbr { return ( nativecast(Pointer[rec_sbr],$!rec).deref ); }
method pmr { return ( nativecast(Pointer[rec_pmr],$!rec).deref ); }
method pgr { return ( nativecast(Pointer[rec_pgr],$!rec).deref ); }
method plr { return ( nativecast(Pointer[rec_plr],$!rec).deref ); }
method rdr { return ( nativecast(Pointer[rec_rdr],$!rec).deref ); }
method wrr { return ( nativecast(Pointer[rec_wrr],$!rec).deref ); }
method wcr { return ( nativecast(Pointer[rec_wcr],$!rec).deref ); }
method tsr { return ( nativecast(Pointer[rec_tsr],$!rec).deref ); }
method mpr { return ( nativecast(Pointer[rec_mpr],$!rec).deref ); }
method ftr { return ( nativecast(Pointer[rec_ftr],$!rec).deref ); }
method bps { return ( nativecast(Pointer[rec_bps],$!rec).deref ); }
method eps { return ( nativecast(Pointer[rec_eps],$!rec).deref ); }
