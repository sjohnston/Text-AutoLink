#!perl
use Test::More;
BEGIN
{
    if (! $ENV{TEST_POD}) {
        plan skip_all => "Enable TEST_POD environment variable to test POD";
    } else {
        eval "use Test::Pod::Coverage";
        if ($@) {
            plan(skip_all => "Test::Pod::Coverage required for testing POD");
        }
    }
}

all_pod_coverage_ok({ trustme => ['process'] });

