package Net::MQ::Message;

use namespace::autoclean;

use Moose::Role;

use MooseX::ClassAttribute;
use MooseX::Storage;
use MooseX::Types::Moose qw(Str HashRef);
use MooseX::Types::Structured qw(Tuple Optional);

with 'MooseX::Storage::Deferred';

class_has transport =>
	isa	=> Tuple[Str,Optional[HashRef]],
	is	=> 'rw';

sub publish
{
	my $self = shift;

	my $class = 'Net::MQ::Transport::' . $self->transport->[0];

	Class::MOP::load_class($class);

	warn $self->freeze({ format => 'JSON' });

	$class->new($self->transport->[1])->publish($self);
}

1;

