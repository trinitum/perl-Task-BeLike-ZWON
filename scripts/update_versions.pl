#!/usr/bin/perl 

use strict;
use warnings;
use CPANPLUS::Backend;
use File::Slurp qw(slurp);

warn "Building module tree...\n";
my $cb = CPANPLUS::Backend->new;
my $href = $cb->module_tree;

warn "Processing Makefile.PL...\n";
my @makefile_lines = slurp('Makefile.PL');
open my $out, '>', 'Makefile.PL.new' or die $!;
for (@makefile_lines) {
    if(/^requires\s+'(\S+)'.*;/){
        my $ver = 0;
        if (defined $href->{$1}) {
            $ver = $href->{$1}->version;
        }
        else {
            warn "Couldn't determine version of $1\n";
        }
        print $out "requires '$1' => '", $ver, "';\n";
    }
    else {
        print $out $_;
    }
}
close $out;
