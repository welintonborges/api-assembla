use Test::More;
use strict;

use API::Assembla;

my $api = API::Assembla->new(
    username => 'iirobot',
    password => $ENV{'TEST_ASSEMBLA_PASS'}
);

my $data = $api->get_spaces;
cmp_ok(2, '==', scalar(keys($data)), '2 spaces');
ok(exists($data->{PRG}), 'PRG space');

my $space = $data->{PRG};
cmp_ok('PRG', 'eq', $space->name, 'space name');

done_testing;