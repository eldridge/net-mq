package Net::MQ;

use Moose;

use Net::MQ::Proxy;

has protocol	=> (is => 'ro', isa => 'Str', required => 1);
#has proxy	=> (is => 'rw', isa => 'Net::MQ::Proxy', handles => \&_dispatcher);
has proxy		=> (is => 'rw', isa => 'Object', handles => \&_dispatcher);
has args		=> (is => 'ro', isa => 'HashRef', default => sub { {} });

sub BUILD
{
	my $self = shift;

	my $protocol	= $self->protocol;
	my $class		= $protocol =~ /^\+/ ? $protocol : 'Net::MQ::' . $protocol;

	Class::MOP::load_class($class);

print STDERR "FART\n";
	$self->proxy($class->new($self->args));
	my %h = map { $_ => $_ } map { $_->get_required_method_list } $self->proxy->meta->calculate_all_roles;
	print STDERR Dumper(\%h);
	print STDERR "SHIT\n";

	$self->meta->get_attribute('proxy')->install_delegation;
	#new Moose::Meta::Method::Delegation attribute => $attr, delegate_to_method => 

#	$self->transport($class->new_with_traits(traits => [ 'Transport', 'Remote' ]));
}

sub _dispatcher
{
	my $attr = shift;
	my $meta = shift;

	my %h = map { $_ => $_ } map { $_->get_required_method_list } $meta->calculate_all_roles;

use Data::Dumper;
	print STDERR "WTF\n\n\n";
	print STDERR "META=$meta\n";
	print STDERR "CLASS=" . $meta->name . "\n";
	print STDERR Dumper(\%h);
	print STDERR Dumper([ $meta->calculate_all_roles ]);
	print STDERR "\n\n\nWTF";


	use Data::Dump;
	dd(\%h);

	%h;

	#return $meta->get_all_method_names
}

__PACKAGE__->meta->make_immutable;

no Moose;

1;
