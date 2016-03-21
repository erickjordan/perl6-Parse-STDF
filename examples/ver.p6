#!/usr/bin/env perl6
use v6;
use lib '../lib';
use Parse::STDF;

sub MAIN( Str $stdf )
{
  try
  {
    my $s = Parse::STDF.new( stdf => $stdf );
    say "STDF Version: " ~ $s.ver;
    CATCH
    {
      when Parse::STDF::E { say $_.message; }
      default { say $_; }
    }
  }
}
