using System;
using System.Collections.Generic;

public class Euler {
    static public void Main() {
        ulong n = 10001;

        ulong limit = (ulong)((n * Math.Log(n)) + (n * (Math.Log(Math.Log(n)))));

        Console.WriteLine("{0}", SieveOfAtkin(limit)[(int)n - 1]);
    }

    static public List<ulong> SieveOfAtkin(ulong limit) {
        List<ulong> primes = new List<ulong>();

        List<bool> sieve = new List<bool>();

        for (ulong i = 0; i < limit + 1; i++) {
            sieve.Add(false);
        }

        ulong squareRootOfLimit = (ulong)Math.Sqrt(limit);

        ulong n;

        for (ulong x = 1; x <= squareRootOfLimit; x++) {
            for (ulong y = 1; y <= squareRootOfLimit; y++) {
                n = (4 * x * x) + (y * y);

                if (n <= limit && (n % 12 == 1 || n % 12 == 5)) {
                    sieve[(int)n] = !sieve[(int)n];
                }

                n = (3 * x * x) + (y * y);

                if (n <= limit && n % 12 == 7) {
                    sieve[(int)n] = !sieve[(int)n];
                }

                n = (3 * x * x) - (y * y);

                if (x > y && n <= limit && n % 12 == 11) {
                    sieve[(int)n] = !sieve[(int)n];
                }
            }
        }

        sieve[2] = true;

        sieve[3] = true;

        primes.Add(2);

        primes.Add(3);

        n = 5;

        while (n <= squareRootOfLimit) {
            if (sieve[(int)n]) {
                ulong i = n * n;

                while (i < limit) {
                    sieve[(int)i] = false;

                    i += n * n;
                }

                primes.Add(n);
            }

            n += 2;
        }

        while (n < limit) {
            if (sieve[(int)n]) {
                primes.Add(n);
            }

            n += 2;
        }

        return primes;
    }
}
