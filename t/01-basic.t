use v6;
use Test;
use lib 'lib';
use Parse::STDF;

plan 2;

use-ok 'Parse::STDF';
nok 'Parse::STDF.new( stdf => "abcdef" )', 'Parse::STDF.new worked';
