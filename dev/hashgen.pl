
use v5.12;
use Benchmark;

my $t = Benchmark->new;

my %colors;

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
    $colors{ 'gray'.$hex }   = $gray;
    $colors{ 'gray'.$dec }   = $gray;
    $colors{ 'grey'.$hex }   = $gray;
    $colors{ 'grey'.$dec }   = $gray;
    $colors{ 'red'.$hex }    = $red;
    $colors{ 'red'.$dec }    = $red;
    $colors{ 'green'.$hex }  = $green;
    $colors{ 'green'.$dec }  = $green;
    $colors{ 'blue'.$hex }   = $blue;
    $colors{ 'blue'.$dec }   = $blue;
    $colors{ 'yellow'.$hex } = $yellow;
    $colors{ 'yellow'.$dec } = $yellow;
    $colors{ 'cyan'.$hex}    = $cyan;
    $colors{ 'cyan'.$dec}    = $cyan;
    $colors{ 'purple'.$hex } = $purple;
    $colors{ 'purple'.$dec } = $purple;
}

for my $dec (0..100){
    my $hex = sprintf "%02x", 2.55 * $dec;
    my $gray   = '0x'.$hex.$hex.$hex;
    my $red    = '0x'.$hex.'0000';
    my $green  = '0x00'.$hex.'00';
    my $blue   = '0x0000'.$hex;
    my $yellow = '0x'.$hex.$hex.'00';
    my $cyan   = '0x00'.$hex.$hex;
    my $purple = '0x'.$hex.'00'.$hex;

    while (length $dec <= 3){
        $colors{ 'gray'.$dec.'%'  } = $gray;
        $colors{ 'grey'.$dec.'%'  } = $gray;
        $colors{ 'red'.$dec.'%'   } = $red;
        $colors{ 'green'.$dec.'%' } = $green;
        $colors{ 'blue'.$dec.'%'  } = $blue;
        $colors{ 'yellow'.$dec.'%'} = $yellow;
        $colors{ 'cyan'.$dec.'%'  } = $cyan;
        $colors{ 'purple'.$dec.'%'} = $purple;
        $dec = '0'.$dec;
    }
    
}

say "generated in ", timestr( timediff( $t, Benchmark->new) );
__END__

          gray   => 0xffffff,
          grey   => 0xffffff,
          red    => 0xff0000,
          green  => 0x00ff00,
          blue   => 0x0000ff,
          yellow => 0xffff00,
          cyan   => 0x00ffff,
          purple => 0xff00ff,
            
