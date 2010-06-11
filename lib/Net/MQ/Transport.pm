package Net::MQ::Transport;

=head1 NAME

Net::MQ::Transport - transport protocol

=cut

use Moose::Role;

requires 'connect';
requires 'poll';
requires 'dequeue';
requires 'ack';

no Moose::Role;

1;
