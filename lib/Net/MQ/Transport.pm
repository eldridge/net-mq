package Net::MQ::Transport;

=head1 NAME

Net::MQ::Transport - transport protocol

=cut

use Moose::Role;

requires 'publish';
requires 'dequeue';
requires 'poll';
requires 'ack';

no Moose::Role;

1;
