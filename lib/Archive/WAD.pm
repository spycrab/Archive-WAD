package Archive::WAD;

use 5.018002;
use strict;
use warnings;

require Exporter;

our @ISA = qw(Exporter);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration	use Archive::WAD ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
our %EXPORT_TAGS = ( 'all' => [ qw(
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
  get_version_string
  get_error_msg
  wad_open
  wad_close
);

our $VERSION = '0.1.0';

require XSLoader;
XSLoader::load('Archive::WAD', $VERSION);

1;
__END__

=head1 NAME

Archive::WAD - A Perl wrapper around libwad

=head1 SYNOPSIS

  use Archive::WAD;
  
  my $wad = Archive::WAD::wad_open($filename);

  die "Error: ".Archive::WAD::get_error_message() unless (defined $wad);

  my $tmd = Archive::WAD::wad_get_tmd($wad);

  Archive::WAD::wad_close($wad);

=head1 DESCRIPTION

Archive::WAD is a perl-wrapper around libwad that is very similar in usage to the library it's based on.

=head2 EXPORT

None by default.

=head1 SEE ALSO

https://github.com/spycrab/libwad

=head1 AUTHOR

spycrab, E<lt>spycrab@users.noreply.github.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2019 by spycrab0

Licensed under the GNU General Public License v3 or any later version at your option.

=cut
