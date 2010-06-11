package Net::MQ::Role::Remote::URI;

=head1 NAME

Net::MQ::Role::Remote::URI - endpoint with URI

=cut

use Moose::Role;

has remote => (is => 'rw', isa => 'URI');

no Moose::Role;

1;
