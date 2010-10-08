package Net::MQ::Publisher;

use namespace::autoclean;

use Moose::Role;

use MooseX::ClassAttribute;

use String::CamelCase;

class_has _mq_namespace =>
	isa		=> 'Str',
	is		=> 'rw';

class_has _mq_subject =>
	isa		=> 'Str',
	is		=> 'rw';

sub emit
{
	my $self = shift;
	my $name = shift;

	my $class = join '::',
		($self->_mq_namespace || ()),
		($self->_mq_subject || ()),
		String::CamelCase::camelize($name);

	Class::MOP::load_class($class);

	my $obj = $class->new;

	$obj->publish;
}

1;

