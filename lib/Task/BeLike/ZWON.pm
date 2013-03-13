package Task::BeLike::ZWON;

use warnings;
use strict;
our $VERSION = '0.10';

=head1 NAME

Task::BeLike::ZWON - install the modules ZWON likes

=head1 DESCRIPTION

This installs modules which I want to be installed.

=head1 METHODS

=cut

=head2 $self->check_cpanm

Ensures that cpanm is installed. If not dies.

=cut

sub check_cpanm {
    system(qw(cpanm -V)) == 0 and return;
    die <<EOM;
You should install cpanm first:

    perlbrew install-cpanm

or

    curl -L http://cpanmin.us | perl - App::cpanminus
EOM
}

my @MAIN = (
    'App::cpanminus',
    'App::cpanoutdated',
    'App::cpanlistchanges',
    'Attribute::Handlers',
    'BerkeleyDB',
    'Carp::Always',
    'Carp::Clan',
    'CGI',
    'CGI::Carp',
    'CGI::Session',
    'DateTime',
    'DateTime::Format::Mail',
    'DateTime::TimeZone',
    'DBD::SQLite',
    'DBI',
    'Devel::Cover',
    'Devel::Declare',
    'Devel::NYTProf',
    'Devel::Size',
    'Devel::StackTrace',
    'Devel::Symdump',
    'ExtUtils::CBuilder',
    'ExtUtils::MakeMaker',
    'ExtUtils::ParseXS',
    'File::ChangeNotify',
    'File::Find::Rule',
    'File::Find::Rule::Perl',
    'File::HomeDir',
    'File::LibMagic',
    'File::Slurp',
    'Geo::IP',
    'HTML::Parser',
    'JSON',
    'JSON::Any',
    'JSON::XS',
    'List::MoreUtils',
    'List::Util',
    'Log::Log4perl',
    'Log::Any',
    'LWP',
    'LWP::Protocol::https',
    'Mail::Box',
    'MIME::Base64',
    'MIME::Lite',
    'Math::Random',
    'Math::Random::MT::Auto',
    'Module::Build',
    'Module::Install',
    'Mojolicious',
    'Moose',
    'MooseX::Types',
    'Mouse',
    'namespace::autoclean',
    'namespace::clean',
    'Net::OpenSSH',
    'Net::SSLeay',
    'Parallel::ForkManager',
    'Path::Class',
    'Path::Tiny',
    'Perl::Tidy',
    'Perl::Version',
    'POE',
    'Pod::Cpandoc',
    'PSGI',
    'RedisDB',
    'Regexp::Common',
    'Scalar::MoreUtils',
    'Socket6',
    'Starman',
    'Template',
    'Term::ReadKey',
    'Term::ReadLine::Gnu',
    'Term::ReadLine::Perl',
    'Test::FailWarnings',
    'Test::LeakTrace',
    'Test::Most',
    'Test::Pod',
    'Test::Pod::Coverage',
    'URI',
    'YAML',
    'YAML::XS',
);

my @OPTIONAL = (
    'AnyEvent',
    'AnyEvent::HTTP',
    'App::Ack',
    'App::Pod2CpanHtml',
    'Astro::MoonPhase',
    'autodie',
    'Cairo',
    'CAM::PDF',
    'Catalyst::Runtime',
    'Catalyst::Devel',
    'Catalyst::Model::DBIC::Schema',
    'Catalyst::Plugin::Authentication',
    'Catalyst::Plugin::Session',
    'Catalyst::Plugin::Session::Store::FastMmap',
    'Catalyst::Plugin::Session::State::Cookie',
    'Catalyst::Action::REST',
    'Catalyst::View::TT',
    'CatalystX::SimpleLogin',
    'CGI::Application',
    'CGI::Application::PSGI',
    'CGI::Application::Plugin::TT',
    'CGI::Emulate::PSGI',
    'CGI::PSGI',
    'CGI::Simple',
    'Crypt::CBC',
    'Crypt::GCrypt',
    'Crypt::RC4',
    'Date::Calc',
    'Date::Manip',
    'DBD::Pg',
    'DBIx::Class',
    'DBIx::Class::Schema::Loader',
    'DBIx::Class::Cursor::Cached',
    'Digest::HMAC',
    'Digest::MD5',
    'Digest::SHA',
    'Email::Address',
    'Email::MIME',
    'Email::Simple',
    'Email::Valid',
    'Event',
    'EV',
    'File::Path::Expand',
    'GD',
    'GD::Graph',
    'Hash::Merge',
    'HTML::FormHandler',
    'HTML::FormHandler::Model::DBIC',
    'HTML::TableExtract',
    'HTTP::Server::Simple',
    'Image::ExifTool',
    'IO::Capture',
    'IO::String',
    'IO::Stringy',
    'IO::Tty',
    'Math::Random',
    'Math::Random::MT::Auto',
    'Module::Load',
    'Module::Pluggable',
    'Module::Starter',
    'MooseX::Declare',
    'MooseX::MethodAttributes',
    'Net::DNS',
    'Net::IP',
    'POE::API::Peek',
    'POE::Component::Client::HTTP',
    'POE::Component::Daemon',
    'POE::Component::Pluggable',
    'POE::Component::SSLify',
    'POE::Component::Server::SimpleHTTP',
    'Parse::RecDescent',
    'Perl6::Junction',
    'Perl::Critic',
    'Perl::Critic::Deprecated',
    'Pod::Coverage',
    'Redis',
    'Redis::Client',
    'Redis::hiredis',
    'Rose::DB::Object',
    'Simulation::DiscreteEvent',
    'Software::License',
    'Sort::Versions',
    'SQL::Translator',
    'Statistics::Basic',
    'Statistics::Descriptive',
    'Syntax::Highlight::Engine::Kate',
    'Test::Class',
    'Test::POE::Client::TCP',
    'Test::POE::Server::TCP',
    'Test::WWW::Mechanize',
    'Test::WWW::Mechanize::Catalyst',
    'Test::WWW::Mechanize::PSGI',
    'Text::Flow',
    'Tie::Array::Sorted',
    'WWW::Mechanize',
    'WWW::Mechanize::Firefox',
    'XML::LibXML',
    'XML::Parser',
    'XML::SAX',
    'XML::Simple',
    'XML::Twig',
);

=head2 $self->install_main

Installs essential modules

=cut

sub install_main {
    print '-' x 40, "\n\n";
    print " Installing essential packages\n";
    print '-' x 40, "\n\n";
    system( 'cpanm', @MAIN );
}

=head2 $self->install_optional

Installs optional modules

=cut

sub install_optional {
    print '-' x 40, "\n\n";
    print " Installing optional packages\n";
    print '-' x 40, "\n\n";
    system( 'cpanm', @OPTIONAL );
}

=head2 $self->update_outdated

Updates outdated modules

=cut

sub update_outdated {
    system('cpan-outdated | cpanm');
}

=head1 SEE ALSO

L<Task>

=head1 AUTHOR

Pavel Shaydo, C<< <zwon at cpan.org> >>


=head1 LICENSE AND COPYRIGHT

Copyright 2010 Pavel Shaydo.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.


=cut

1;    # End of Task::BeLike::ZWON
