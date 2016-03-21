import math
import itertools
import time

sqrt = math.sqrt

count = itertools.count

clock = time.clock

def pe44(prove=False, printit=0):
    """ D, a, b, S are pentagon numbers
        a + b  = S
        |b- a| = D
        phase 1: search for a solution (0.2 s) -> min_D
                 given D, b -> test a = b - D and S = 2 * b - D
                 a < b < S, D < b < S in the method below
                 a may be larger or smaller than D, but is positive
                 As a < b, we can test if a in pentagonals.
                 S is larger than b and we have to use is_pent
        If prove is True then phase 2 proves that there is no solution with
          a D lower than min_D:
            phase 2: try to find a solution with a lower D
            if D is smaller than b - b_prev it can be removed from Ds
            search stops if D < b - b_prev for all D in Ds (Ds is empty)
            total time 250 sec. In C this should be only a few secs.
    """
    def pent(n): return n * (3 * n - 1) // 2
    def is_pent(N): return ((sqrt(24 * N + 1) + 1) / 6.0).is_integer()
    ps = set() # keeps pentagonal numbers smaller than b
    Ds = []    # keeps the list of possible D
    min_D = 0
    b = 0
    t0 = clock()
    for b_index in count(1):
        b_prev = b
        b = pent(b_index)
        delta = b - b_prev
        # any D smaller than delta can be removed, as a=b-D cannot be pentagonal
        if Ds and Ds[0] < delta:
            Ds.pop(0)
        if printit and b_index % printit == 0:
            print b_index, clock() - t0, len(Ds)
        # if min_D is found and no Ds we can stop
        if min_D and not (prove and Ds):
            break
        for D in Ds:
            if b - D in ps:
                print("b = {} d = {} | {} | {} | {}".format(b, D, b - D, 2 * b - D, is_pent(2 * b - D)))

                if is_pent(2 * b - D):
                    min_D = D
                    while Ds[-1] >= min_D: # from now on only check D < min_D
                        Ds.pop()
                    break
        ps.add(b)
        if not min_D:
            Ds.append(b)
    return min_D

print(pe44(prove=False, printit=100))
