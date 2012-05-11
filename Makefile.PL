use 5.008;
use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME           => 'Task::BeLike::ZWON',
    AUTHOR         => q{Pavel Shaydo <zwon@cpan.org>},
    VERSION_FROM   => 'lib/Task/BeLike/ZWON.pm',
    ABSTRACT_FROM  => 'lib/Task/BeLike/ZWON.pm',
    LICENSE        => 'perl',
    EXE_FILES       => [q(bin/be-like-zwon.pl)],
    BUILD_REQUIRES => {
        'Test::More'  => 0.94,
    },
    dist       => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean      => { FILES    => '[% st.dist_dir_name %]-*' },
);
