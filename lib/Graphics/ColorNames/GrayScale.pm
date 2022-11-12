package Graphics::ColorNames::GrayScale;

require 5.006;

use strict;
use warnings;

our $VERSION = '3.01';
my %RgbColors = ();

sub NamesRgbTable { 
    unless (keys %RgbColors) {
        for (0..255){
            my $hex = sprintf "%02x", $_;
            my $dec = sprintf "%03i", $_;
            my $gray   = '0x'.$hex.$hex.$hex;
            my $red    = '0x'.$hex.'0000';
            my $green  = '0x00'.$hex.'00';
            my $blue   = '0x0000'.$hex;
            my $yellow = '0x'.$hex.$hex.'00';
            my $cyan   = '0x00'.$hex.$hex;
            my $purple = '0x'.$hex.'00'.$hex;
            $RgbColors{ 'gray'.$hex }   = $gray;
            $RgbColors{ 'gray'.$dec }   = $gray;
            $RgbColors{ 'grey'.$hex }   = $gray;
            $RgbColors{ 'grey'.$dec }   = $gray;
            $RgbColors{ 'red'.$hex }    = $red;
            $RgbColors{ 'red'.$dec }    = $red;
            $RgbColors{ 'green'.$hex }  = $green;
            $RgbColors{ 'green'.$dec }  = $green;
            $RgbColors{ 'blue'.$hex }   = $blue;
            $RgbColors{ 'blue'.$dec }   = $blue;
            $RgbColors{ 'yellow'.$hex } = $yellow;
            $RgbColors{ 'yellow'.$dec } = $yellow;
            $RgbColors{ 'cyan'.$hex}    = $cyan;
            $RgbColors{ 'cyan'.$dec}    = $cyan;
            $RgbColors{ 'purple'.$hex } = $purple;
            $RgbColors{ 'purple'.$dec } = $purple;
        }

        for my $dec (0..100) {
            my $hex = sprintf "%02x", 2.55 * $dec;
            my $gray   = '0x'.$hex.$hex.$hex;
            my $red    = '0x'.$hex.'0000';
            my $green  = '0x00'.$hex.'00';
            my $blue   = '0x0000'.$hex;
            my $yellow = '0x'.$hex.$hex.'00';
            my $cyan   = '0x00'.$hex.$hex;
            my $purple = '0x'.$hex.'00'.$hex;

            while (length $dec <= 3){
                $RgbColors{ 'gray'.$dec.'%'  } = $gray;
                $RgbColors{ 'grey'.$dec.'%'  } = $gray;
                $RgbColors{ 'red'.$dec.'%'   } = $red;
                $RgbColors{ 'green'.$dec.'%' } = $green;
                $RgbColors{ 'blue'.$dec.'%'  } = $blue;
                $RgbColors{ 'yellow'.$dec.'%'} = $yellow;
                $RgbColors{ 'cyan'.$dec.'%'  } = $cyan;
                $RgbColors{ 'purple'.$dec.'%'} = $purple;
                $dec = '0'.$dec;
            }
            
        }
    }
    return \%RgbColors;
}

1;

__END__

=head1 NAME

Graphics::ColorNames::GrayScale - RGB values of shades of gray and base colors

=head1 SYNOPSIS

  require Graphics::ColorNames::GrayScale;

  $NameTable = Graphics::ColorNames::GrayScale->NamesRgbTable();
  $RgbColor  = $NameTable->{gray80};


=head1 DESCRIPTION

See the documentation of L<Graphics::ColorNames> for information how to
use this module.

This module provides grayscale colors for L<Graphics::ColorNames>.
The following are valid colors:

  Format  Example  Description

  grayHH  grey80   Gray value in hexidecimal (HH between 00 and ff)
  grayDDD gray128  Gray value in decimal (DDD between 000 and 255)
  grayP%  gray50%  Gray value in percentage (P between 0 and 100)

Besides C<gray>, on can also use the following colors:

  red
  green
  blue
  yellow
  cyan
  purple

Lower values are darker, higher values are brighter.

=head1 AUTHOR

Robert Rothenberg <rrwo at cpan.org>

=head1 MAINTAINER

Herbert Breunung <lichtkind@cpan.org>

=head1 LICENSE

Copyright (c) 2004-2022 Robert Rothenberg. All rights reserved.
This program is free software; you can redistribute it and/or
modify it under the same terms as Perl itself.

=cut
