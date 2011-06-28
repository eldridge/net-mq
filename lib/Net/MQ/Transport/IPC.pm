package Net::MQ::Transport::IPC;

use Moose;

use namespace::autoclean;

=head1 NAME

Net::MQ::Transport::IPC - UNIX System V IPC transport

=head1 DESCRIPTION

=cut

with 'Net::MQ::Transport';

sub connect
{
	...
}

sub publish
{
	...
}

sub dequeue
{
	...
{

sub poll
{
	...
}

sub ack
{
	...
}

1;

