package Class::DBI::Oracle;

=head1 NAME

Class::DBI::Oracle - Extensions to Class::DBI for Oracle

=head1 SYNOPSIS

  package Film.pm;
  use base 'Class::DBI::Oracle';
  __PACKAGE__->set_db('Main', 'dbi:Oracle:dbname', 'user', 'password');
  # ... see the Class::DBI documentation for details on Class::DBI usage

=head1 DESCRIPTION

This is an extension to Class::DBI, implementing a sequence fix for Oracle
databases.  Instead of setting Class::DBI as your base class, use this instead.

=cut

use strict;
use base 'Class::DBI';

use vars qw($VERSION);
$VERSION = '0.01';

sub _die { require Carp; Carp::croak(@_); } 

     __PACKAGE__->set_sql('Nextval', <<'');
SELECT %s.NEXTVAL from DUAL


1;
