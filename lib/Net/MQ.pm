package Net::MQ;

=head1 NAME

Net::MQ - abstract message queue framework

=head1 DESCRIPTION

=cut

use Moose;

has protocol	=> (is => 'ro', isa => 'Str', required => 1);
#has proxy	=> (is => 'rw', isa => 'Net::MQ::Proxy', handles => \&_dispatcher);
#has proxy		=> (is => 'rw', isa => 'Object', handles => \&_dispatcher);
has args		=> (is => 'ro', isa => 'HashRef', default => sub { {} });

__PACKAGE__->meta->make_immutable;

no Moose;

1;
