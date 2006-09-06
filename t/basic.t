#!perl

use strict;
use warnings;

use Test::More tests => 11;

BEGIN { use_ok('Data::UUID'); }

my $ug = Data::UUID->new;
isa_ok($ug, 'Data::UUID');

ok(my $uuid1 = $ug->create(),             "create a new uuid");
ok(my $uuid2 = $ug->to_hexstring($uuid1), "hexstringify it");
ok(my $uuid3 = $ug->from_string($uuid2),  "create a uuid from that string");
ok(!$ug->compare($uuid1, $uuid3),         "they compare as equal");

ok(my $uuid4 = $ug->to_b64string($uuid1), "get base64 string of original uuid");
ok(my $uuid5 = $ug->to_b64string($uuid3), "get base64 string of from_string");
is($uuid4, $uuid5,                        "those base64 strings are equal");

ok(my $uuid6 = $ug->from_b64string($uuid5), "make uuid from the base64 string");
ok(!$ug->compare($uuid6,$uuid1),            "and it compares at equal, too");
