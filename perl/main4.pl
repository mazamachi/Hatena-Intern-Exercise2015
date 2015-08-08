use strict;
use warnings;

use Data::Dumper;

use Parser;
use LogCounter;
use Math::Round;

my $parser = Parser->new( filename => '../sample_data/large_log.ltsv' );
my $counter = LogCounter->new($parser->parse);
my $data = $counter->count_code;
# print Dumper $data;

# 目盛り幅を決めるため、最大値を取得
my $max=0;
foreach my $path (keys(%$data)){
	foreach my $code (keys(%{$data->{$path}})) {
		if ($max < $data->{$path}{$code}){
			$max = $data->{$path}{$code};
		}	
	}	
}

my $scale;
if($max<10){
	$scale = 1;
}else{
	my $order = int(log($max)/log(10));
	$scale = 10**($order-1);
}

foreach my $path (sort keys(%$data)){
	print $path."\n";
	print "---:";
	foreach my $i (1..int($max/($scale*10))) {
		print " " x (10-length($scale*10)).($i*$scale*10);
	}
	print "\n";
	foreach my $code (sort keys(%{$data->{$path}})) {
		print $code.":".("=" x ($data->{$path}{$code}/$scale - 1))."*".$data->{$path}{$code}."\n";
	}
}