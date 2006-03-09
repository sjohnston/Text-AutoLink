use strict;
use Module::Build;

my $class = Module::Build->subclass(code => <<'EOSUB');
    sub ACTION_disttest
    {
        my $self = shift;
        local $ENV{PERL_TESTPOD} = 1;
        $self->SUPER::ACTION_disttest(@_);
    }

    sub find_test_files
    {
        my $self  = shift;
        my $tests = $self->SUPER::find_test_files(@_);

        return $tests if $ENV{PERL_TESTPOD};
        return [ grep { $_ !~ /\bpod.*\.t\z/ } @$tests ];
    }
EOSUB

my $build = $class->new(
    dist_version_from => 'lib/Text/AutoLink.pm',
    dist_name => 'Text-AutoLink',
    requires => {
        'HTML::TreeBuilder' => 0,
        'Module::Pluggable' => 0,
    },
    license => 'perl',
    recursive_test_files => 1,
    create_readme => 1,
    create_makefile_pl => 'traditional',
);

$build->create_build_script();