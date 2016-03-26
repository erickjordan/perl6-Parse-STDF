use v6;
use Test;
use lib 'lib';
use Parse::STDF;

plan 22;
my $s = Parse::STDF.new( stdf => "t/data/test.stdf" );
my %rec_names = :MIR(0), :SDR(0), :PCR(0), :MRR(0), :WIR(0), :PIR(0), :DTR(0), :ATR(0), :HBR(0),
                :SBR(0), :PMR(0), :PGR(0), :PLR(0), :RDR(0), :WRR(0), :WCR(0), :TSR(0), :MPR(0), 
				:FTR(0), :BPS(0), :EPS(0);
while $s.get_record { %rec_names{$s.recname}++; }
for %rec_names.kv -> $key, $val { ok $val > 0, "Checked record name: $key"; }
