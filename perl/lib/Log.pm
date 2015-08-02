package Log;
use strict;
use warnings;
use DateTime;
sub new {
    my ($class, %args) = @_;
    return bless \%args, $class;
}

sub protocol {
	my ($self, %args) = @_;
    my ($method, $path, $protocol) = split / /, $self->{req};
	return $protocol;
}

sub method {
	my ($self, %args) = @_;
	my ($method, $path, $protocol) = split / /, $self->{req};
	return $method;
}

sub path {
	my ($self, %args) = @_;
	my ($method, $path, $protocol) = split / /, $self->{req};
	return $path;
}

sub uri {
	my ($self, %args) = @_;
	my $uri = 'http://'.$self->{host}.$self->path;
	return $uri;
}

sub time {
	my ($self, %args) = @_;
	my $dt = DateTime->from_epoch( epoch => $self->{epoch});
	return $dt->strftime('%Y-%m-%dT%H:%M:%S');
}

sub to_hash{
	my $self = shift @_;
	my %hash;
    $hash{status} = $self->{status} if $self->{status};
    $hash{size} = $self->{size} if $self->{size};
    $hash{user} = $self->{user} if $self->{user};
    $hash{referer} = $self->{referer} if $self->{referer};

	$hash{method} = $self->method if $self->{req};
	$hash{uri} = $self->uri if $self->{req} && $self->{host};
	$hash{time} = $self->time if $self->{epoch}; 
	return \%hash;
}

1;
