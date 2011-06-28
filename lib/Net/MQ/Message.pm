package Net::MQ::Message;

use namespace::autoclean;

use Moose::Role;

use MooseX::ClassAttribute;
use MooseX::Storage;
use MooseX::Types::Moose qw(Str HashRef Object);
use MooseX::Types::Structured qw(Tuple Optional);

with 'MooseX::Storage::Deferred';

class_has transport =>
	isa	=> Tuple[Str,Optional[HashRef]],
	is	=> 'rw';

has source =>
	metaclass	=> 'DoNotSerialize',
	isa			=> Object,
	is			=> 'rw';

has key =>
	metaclass	=> 'DoNotSerialize',
	isa			=> Str,
	is			=> 'ro',
	required	=> 1;

sub publish
{
	my $self = shift;

	my $class = $self->transport->[0] =~ /^\+/
		? $self->transport->[0]
		: 'Net::MQ::Transport::' . $self->transport->[0];

	Class::MOP::load_class($class);

	warn $self->freeze({ format => 'JSON' });

	$class->new($self->transport->[1])->publish($self);
}

1;

