#!/usr/bin/env perl
#===============================================================================
#
#         FILE: script-server.pl
#
#        USAGE: ./script-server.pl  
#
#  DESCRIPTION: 
#
#       AUTHOR: YOUR NAME (), 
#      VERSION: 1.0
#      CREATED: 10/12/2020 02:24:19 PM
#     REVISION: ---
#===============================================================================
use strict;
use warnings;
use utf8;
use Dancer2;

set 'logger' => 'console';
set 'log' => 'debug';

get "/stage1" => sub {
  info "user requested stage1\n";
  my $file = "stage1.sh";
  send_file($file
    ,'content-type' => 'text/plain/'
    ,'filename' => $file);
};

get "/stage2" => sub {
  info "user requested stage2\n";
  my $file = "stage2.sh";
  send_file($file
    ,'content-type' => 'text/plain/'
    ,'filename' => $file);
};

dance;
