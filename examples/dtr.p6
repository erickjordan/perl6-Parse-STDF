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
        when "DTR"
        {
          say $s.dtr.TEXT_DAT.cnstr;
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

