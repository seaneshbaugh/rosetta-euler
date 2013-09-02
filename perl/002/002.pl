use strict;

use List::Util qw(reduce);

my @fibs = (0, 1);

while (@fibs[-1] + @fibs[-2] < 4000000) {
  push(@fibs, @fibs[-1] + @fibs[-2]);
}

print reduce { $a + $b } grep($_ % 2 == 0, @fibs);

print "\n";
