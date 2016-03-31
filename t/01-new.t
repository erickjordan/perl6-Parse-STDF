use v6;
use Test;
use Parse::STDF;

plan 1;
try
{
  my $s = Parse::STDF.new( stdf => "t/data/test.stdf" );
  ok defined($s), 'New object instance created for test.stdf';
  CATCH
  {
    when X::Parse::STDF::LibraryMissing { skip-rest($_.message); }
  }
}

