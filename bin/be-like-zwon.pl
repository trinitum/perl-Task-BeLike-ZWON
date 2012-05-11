#!/usr/bin/env perl
use strict;
use warnings;

use Task::BeLike::ZWON;
use Getopt::Long;

my ( $main, $optional, $update ) = ( 1, 1, 1 );
GetOptions(
    "essential" => sub { $optional = 0 },
    "update!" => $update,
) or die;

Task::BeLike::ZWON->check_cpanm;
Task::BeLike::ZWON->install_main     if $main;
Task::BeLike::ZWON->install_optional if $optional;
Task::BeLike::ZWON->update_outdated  if $update;
