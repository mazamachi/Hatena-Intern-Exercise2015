use strict;
use warnings;

use Data::Dumper;

use Parser;
use LogCounter;

my $parser = Parser->new( filename => '../sample_data/log.ltsv' );
my $counter = LogCounter->new($parser->parse);
print 'total error size: ' . $counter->count_error . "\n";
$counter->group_by_user;
print Dumper $counter->group_by_user;
