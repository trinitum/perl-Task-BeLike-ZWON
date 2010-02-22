#!/usr/bin/perl 

use strict;
use warnings;
use CPANPLUS::Backend;
use File::Slurp qw(slurp);

my $cb = CPANPLUS::Backend->new;
my $href = $cb->module_tree;

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
