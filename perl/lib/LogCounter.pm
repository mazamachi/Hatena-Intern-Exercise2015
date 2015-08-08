package LogCounter;
use strict;
use warnings;

sub new {
    my ($class, $logs) = @_;
    return bless { logs => $logs }, $class;
};

sub group_by_user {
	my ($self, @args) = @_;
	my %h;
	foreach my $log (@{$self->{logs}}) {
		my $user_name = ($log->{user}) ? $log->{user} : "guest";
		if($h{$user_name}){
			push $h{$user_name}, $log;
		}else{
			$h{$user_name} = [$log];
		}
	}
	return \%h;
}

sub count_error {
	my ($self, @args) = @_;
	my $counter = 0;
	foreach my $log (@{$self->{logs}}) {
		$counter++ if ($log->{status} >= 500 && $log->{status} <= 599);
	}
	return $counter;
}

# コードと出現回数のハッシュを返す
sub count_code {
	my ($self, @args) = @_;
	my $counter;
	%$counter = ();
	foreach my $log (@{$self->{logs}}) {
		unless (exists $counter->{$log->{path}}){
			%$counter->{$log->{path}} = ();
		}
		$counter->{$log->{path}}->{$log->{status}} += 1;
	}
	return $counter;
}

1;
