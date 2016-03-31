use v6;
use Test;
use Parse::STDF;

plan 1;
try
{
  my $s = Parse::STDF.new( stdf => "t/data/test.stdf" );
  is $s.ver, 4, 'STDF version is 4';
  CATCH
  {
    when X::Parse::STDF::LibraryMissing { skip-rest($_.message); }
  }
}
