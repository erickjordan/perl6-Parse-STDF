# BUGS
Parse::STDF was developed and tested using Perl 6.c, Rakudo version 2015.12-199-g5ed58f6 built 
on MoarVM version 2015.12-29-g8079ca5.  There is a bug (see <https://rt.perl.org/Public/Bug/Display.html?id=127144>)
which impacts some of the class attributes typed as `uint8`.  Until this bug is fixed, workarounds may be needed.
See **examples/summary.p6** on how to do this.

# PERFORMANCE
Perl6 is painfully slow.  Waiting for a faster version before making a release.

# t/06-mir.t
Test #4 fails with ...
Cannot look up attributes in a type object
  in method ctime at ../lib/Parse/STDF/Native.pm6 line 91
  in block  at t/06-mir.t line 19
  in block <unit> at t/06-mir.t line 11

For some reason, nativecall fails to create a SETUP_T attribute for class rec_mir.
This only happens with t/data/test.stdf.  Other stdf files are fine. Likely has something to do 
with the value for SETUP_T (unint32) set to 0s.

