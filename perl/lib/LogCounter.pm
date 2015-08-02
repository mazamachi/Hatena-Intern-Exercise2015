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
}

1;
