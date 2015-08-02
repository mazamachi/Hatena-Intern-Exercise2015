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
    my ($method, $path, $protocol) = split / /, $args{req};
	return $protocol;
}

sub method {
	my ($self, %args) = @_;
	my ($method, $path, $protocol) = split / /, $args{req};
	return $method;
}

sub path {
	my ($self, %args) = @_;
	my ($method, $path, $protocol) = split / /, $args{req};
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

1;
