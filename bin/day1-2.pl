#!/usr/bin/env perl
use Mojo::Base -strict;

use List::Util qw(max sum);

my $file = defined $ARGV[0] ? $ARGV[0] : 'inputs/day1';
$file = "inputs/day01-$file" if $file =~ /test/;

my $elves = [];
my $curr = [];

open(my $fh, '<', $file) or die $!;
while (<$fh>) {
    chomp;
    if (!$_) {
        push @$elves, $curr;
        $curr = [];
        next;
    }

    push @$curr, $_;
}

push @$elves, $curr;

my @sorted = sort { $b <=> $a } map { sum @$_ } @$elves;
say sum @sorted[0..2];
