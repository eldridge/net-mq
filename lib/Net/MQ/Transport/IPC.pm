package Net::MQ::Transport::IPC;

use 5.14.0;

=head1 NAME

Net::MQ::Transport::IPC - UNIX System V IPC transport

=head1 DESCRIPTION

=cut

use namespace::autoclean;

use Moose;

use IPC::SysV qw(S_IRUSR S_IWUSR);
use IPC::Msg;

with 'Net::MQ::Transport';

has ipc =>
	isa	=> 'IPC::Msg',
	is	=> 'rw';

sub bind
{
	my $self	= shift;
	my $uri		= shift;

	my $ipc = new IPC::Msg $key, S_IRUSR | S_IWUSR;


}

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
}

sub poll
{
	...
}

sub ack
{
	...
}

1;

