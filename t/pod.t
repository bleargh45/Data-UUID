use Test::More;

plan skip_all => "Test::Pod::Coverage 1.06 required for testing POD coverage"
	unless $ENV{AUTHOR_TESTING};

eval "use Test::Pod 1.14";
plan skip_all => "Test::Pod 1.14 required for testing POD" if $@;

all_pod_files_ok();
