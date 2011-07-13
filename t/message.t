use Test::More;
use Test::Moose;

use_ok 'Moose::Meta::Class';

my $class = Moose::Meta::Class->create_anon_class(roles => [ 'Net::MQ::Message' ]);

isa_ok $class, 'Moose::Meta::Class';

my $msg = $class->new_object;

done_testing;

