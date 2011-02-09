#!/usr/bin/perl

use FindBin qw($Bin);
use Test::More 'no_plan';
use Data::Dumper;
use Test::MTA::Exim4;
use Cwd;

my $PREFIX=getcwd.'/install';

my $exim_path = "$PREFIX//bin/exim";
my $exim_conf = "$PREFIX/configure";

my $exim =
  Test::MTA::Exim4->new( { exim_path => $exim_path, config => $exim_conf } );
ok( $exim, 'Created exim test object' );
$exim->config_ok;
