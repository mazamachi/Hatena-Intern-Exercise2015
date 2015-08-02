package Parser;
use strict;
use warnings;
use Log;
sub new {
    my ($class, %args) = @_;
    return bless \%args, $class;
}

sub parse {
	my ($self, %args) = @_;
	open my $fh, '<', $self->{filename} or die $!;
	my @result = ();
	while(my $line = <$fh>){
		my @data = split /\t/, $line;
		my %args_for_log = ();
		foreach my $datum (@data) {
			my($label, $value) = split /:/, $datum;
			chomp ($value);
			$args_for_log{$label} = $value if $value ne '-';
		}
		push @result, Log->new(%args_for_log);
	}
	return \@result;
}

1;
