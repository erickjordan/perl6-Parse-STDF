# Parse::STDF - Module for parsing files in Standard Test Data Format
Standard Test Data Format (STDF) is a widely used standard file format for semiconductor test information. 
It is a commonly used format produced by automatic test equipment (ATE) platforms from companies such as 
LTX-Credence, Roos Instruments, Teradyne, Advantest, and others.

A STDF file is compacted into a binary format according to a well defined specification originally designed by 
Teradyne. The record layouts, field definitions, and sizes are all described within the specification. Over the 
years, parser tools have been developed to decode this binary format in several scripting languages, but as 
of yet nothing has been released to CPAN for Perl.

Parse::STDF is a first attempt. It is an object oriented module containing methods which invoke APIs of
an underlying C library called **libstdf** (see <http://freestdf.sourceforge.net/>).  libstdf performs 
the grunt work of reading and parsing binary data into STDF records represented as C-structs.  These 
structs are in turn referenced as Perl objects.

## SYNOPSIS
    #!/usr/bin/env perl6

    use v6;
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
              printf("Started At: %s\n", $mir.START_T.ctime);
              printf("Station Number: %d\n", $mir.STAT_NUM);
              printf("Station Mode: %s\n", $mir.MODE_COD.chr);
              printf("Retst_Code: %s\n", $mir.RTST_COD.chr);
              printf("Lot: %s\n", $mir.LOT_ID.cnstr);
              printf("Part Type: %s\n", $mir.PART_TYP.cnstr);
              printf("Node Name: %s\n", $mir.NODE_NAM.cnstr);
              printf("Tester Type: %s\n", $mir.TSTR_TYP.cnstr);
              printf("Program: %s\n", $mir.JOB_NAM.cnstr); 
              printf("Version: %s\n", $mir.JOB_REV.cnstr);
              printf("Sublot: %s\n", $mir.SBLOT_ID.cnstr);
              printf("Operator: %s\n", $mir.OPER_NAM.cnstr);
              printf("Executive: %s\n", $mir.EXEC_TYP.cnstr);
              printf("Test Code: %s\n", $mir.TEST_COD.cnstr);
              printf("Test Temperature: %s\n", $mir.TST_TEMP.cnstr);
              printf("Package Type: %s\n", $mir.PKG_TYP.cnstr);
              printf("Facility ID: %s\n", $mir.FACIL_ID.cnstr);
              printf("Design Revision: %s\n", $mir.DSGN_REV.cnstr);
              printf("Flow ID: %s\n", $mir.FLOW_ID.cnstr);
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

## INSTALLATION
TODO

## DEPENDENCIES
Parse::STDF is dependent upon **libstdf**.  As such, this module is constrained to linux platforms.
If and when a windows version of libstdf becomes available Parse::STDF may require a little modification.

## TESTED PLAFORMS
The following platforms have been tested:

* RHEL Linux 6.x (x84_64)
* Ubuntu 12.04 LTS (i686)

## NativeCall
Parse::STDF uses NativeCall to interface with libstdf.  Its easy to use, a natural fit and the next best 
thing to sliced cheese.  No need for ::XS, SWIG (or other bridging software) to interface a C library with Perl.
NativeCall makes installation of Parse::STDF simple and straightforward.  There are only two things required 
to get Parse::STDF up and running.  Thing one, install libstdf. Thing two, install Parse::STDF.

The appeal for using libstdf is in the manner by which it models STDF records using C-structs.  These structs
are highly reusable and provide a solid foundation to quickly and easily build an application specific parser.
For example, a parser to extract token/value pairs from DTR records to insert rows into a data base table.

NativeCall represents C-structs nicely as Perl6 class objects.  This is accomplished by declaring a perl6 class
using the **repr** trait.  See detail documenation here <https://doc.perl6.org/language/nativecall>.  In addition
to C-structs NativeCall also represents pointer types which is critical for navigating the various APIs and 
structs employed by libstdf.  These powerful features (and others) make it possible to extend perl seamlessly
without having to write customized C code. 

### NativeCast
Navigating objects of libstdf requires a fair amount of C type casting.  Following example was taken from
**libstdf/examples/dump_records_to_ascii.c**:

    case REC_DTR: {
      rec_dtr *dtr = (rec_dtr*)rec;
      print_str("TEXT_DAT", dtr->TEXT_DAT);
      break;
    }

Here, `rec` is a pointer to C-struct called `rec_unknown`.  It is later type casted as a `rec_dtr` type.  To mimic 
this behavior in perl6 NativeCall provides an API called `nativecast` which effectively performs the same task as a C
type cast.  The above can be written as the following in perl6:

    nativecast(Pointer[rec_dtr], Pointer[rec]);

`nativecast` along with some other perl6 tricks made available by NaticeCall makes it possible to navigate libstdf
objects just as if it were written in C.

## BUGS
Parse::STDF was developed and tested using Perl 6.c, Rakudo version 2015.12-199-g5ed58f6 built 
on MoarVM version 2015.12-29-g8079ca5.  There is a bug (see <https://rt.perl.org/Public/Bug/Display.html?id=127144>)
which impacts some of the class attributes typed as `uint8`.  Until this bug is fixed, workarounds may be needed.
See **examples/summary.p6** on how to do this.

## SEE ALSO
For an intro to the Standard Test Data Format (along with references to detailed documentation) 
see <http://en.wikipedia.org/wiki/Standard_Test_Data_Format>.

