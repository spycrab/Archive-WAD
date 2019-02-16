# Before 'make install' is performed this script should be runnable with
# 'make test'. After 'make install' it should work as 'perl Archive-WAD.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use strict;
use warnings;
use v5.10;

use Test::More tests => 2;
BEGIN { $ENV{PERL_DL_NONLAZY} = 0; use_ok('Archive::WAD') };

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

my $version = Archive::WAD::get_version_string();

pass("version-string");
diag("Version string is $version");
