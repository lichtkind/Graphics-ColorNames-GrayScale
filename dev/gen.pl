
use v5.12;
use Benchmark;

my $t = Benchmark->new;

my $colors;

for (0..255){
    my $hex = sprintf "%02x", $_;
    my $dec = sprintf "%03i", $_;

    say "  'gray$hex'    => 0x$hex$hex$hex,";
    say "  'gray$dec'   => 0x$hex$hex$hex,";
    say "  'grey$hex'    => 0x$hex$hex$hex,";
    say "  'grey$dec'   => 0x$hex$hex$hex,";
    say "  'red$hex'     => 0x$hex".'0000,';
    say "  'red$dec'    => 0x$hex".'0000,';
    say "  'green$hex'   => 0x00$hex".'00,';
    say "  'green$dec'  => 0x00$hex".'00,';
    say "  'blue$hex'    => 0x0000$hex,";
    say "  'blue$dec'   => 0x0000$hex,";
    say "  'yellow$hex'  => 0x$hex$hex".'00,';
    say "  'yellow$dec' => 0x$hex$hex".'00,';
    say "  'cyan$hex'    => 0x00$hex$hex,";
    say "  'cyan$dec'   => 0x00$hex$hex,";
    say "  'purple$hex'  => 0x$hex".'00'."$hex,";
    say "  'purple$dec' => 0x$hex".'00'."$hex,";
}

for (0..100){
    my $hex = sprintf "%02x", 2.55 * $_;
    my $dec =                $_;
    my $space = ' ' x (4 - length $dec);
    while (length $dec <= 3){
        say "  'grey$dec%'  $space=> 0x$hex$hex$hex,";
        say "  'gray$dec%'  $space=> 0x$hex$hex$hex,";
        say "  'red$dec%'   $space=> 0x$hex".'0000,';
        say "  'green$dec%' $space=> 0x00$hex".'00,';
        say "  'blue$dec%'  $space=> 0x0000$hex,";
        say "  'yellow$dec%'$space=> 0x$hex$hex".'00,';
        say "  'cyan$dec%'  $space=> 0x00$hex$hex,";
        say "  'purple$dec%'$space=> 0x$hex".'00'."$hex,";
        $dec = '0'.$dec;
        chop $space;
    }
    
}
say for keys %$colors;

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
            
