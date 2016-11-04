#!/usr/bin/env perl6
unit module starter;

use HTTP::Server::Threaded;
use Test;

my $host = '127.0.0.1';
my $port = (6000..8000).pick;
my $s;

sub host is export { $host; }
sub port is export { $port; }
sub srv(|opts) is export {
  $s = HTTP::Server::Threaded.new(:ip($host), :$port, |opts) or die 'dead';
  return $s;
}
sub req is export {
  my $c;
  my $s = False;
  while !$s {
    try {
      $c = IO::Socket::INET.new(:$host, :$port) or die 'couldn\'t connect';
      $s = True;
    }
  }
  return $c;
}
# vi:syntax=perl6
