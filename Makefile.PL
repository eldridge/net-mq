use warnings;
use strict;

use inc::Module::Install;

name			'Net::MQ';
author			'Mike Eldridge <diz@cpan.org>';
license			'perl';
version_from	'lib/Net/MQ.pm';

requires 'Moose' => '1.15';

WriteAll;

