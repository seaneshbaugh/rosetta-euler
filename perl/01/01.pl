use strict;

use List::Util qw(reduce);

print reduce { $a + $b } grep($_ % 3 == 0 || $_ % 5 == 0, (1..999));

print "\n";
