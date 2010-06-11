package Net::MQ::Proxy;

use Moose;

with 'MooseX::Traits';

has '+_trait_namespace' => (default => 'Net::MQ');

__PACKAGE__->meta->make_immutable;

no Moose;

1;
