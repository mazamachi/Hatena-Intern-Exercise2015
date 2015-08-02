package Log;
use strict;
use warnings;
sub new {
    my ($class, %args) = @_;
    ($args{method}, $args{path}, $args{protocol}) = split / /, $args{req};
    return bless \%args, $class;
}

sub protocol {
	my ($self, %args) = @_;
	return $self->{protocol};
}

sub method {
	my ($self, %args) = @_;
	return $self->{method};
}

sub path {
	my ($self, %args) = @_;
	return $self->{path};
}

sub uri {
	my ($self, %args) = @_;
	my $uri = 'http://'.$self->{host}.$self->path;
	return $uri;
}

sub time {

}

1;
