use strict;

use POSIX;

sub is_prime {
  my ($x) = shift;

  my @lower_primes = (2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97);

  if (grep {$_ eq $x || $x % $_ == 0 } @lower_primes) {
    return 0;
  }

  my $upper_margin = ceil(sqrt($x)) + 1;

  my $current = 101;

  while ($current < $upper_margin) {
    if ($x % $current) {
      return 0;
    }

    $current += 2;
  }

  return 1;
}

sub max_prime_factor {
  my ($x) = shift;

  my $guess = ceil(sqrt($x));

  if ($x % 2 == 0) {
    $guess += 1
  }

  while ($guess > 1) {
    if ($x % $guess == 0 && is_prime($guess)) {
      return $guess;
    }

    $guess -= 2;
  }

  return $guess;
}

print max_prime_factor(600851475143);

print "\n";
