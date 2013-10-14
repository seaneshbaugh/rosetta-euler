using System;
using System.Collections.Generic;
using System.Linq;

public class Euler {
    static public void Main() {
        List<List<ulong>> primeFactorLists = new List<List<ulong>>();

        for (ulong x = 1; x <= 20; x++) {
            primeFactorLists.Add(PrimeFactors(x));
        }

        List<ulong> factors = new List<ulong>();

        for (int i = 0; i < 20; i++) {
            factors = Overlap(factors, primeFactorLists[i]);
        }

        Console.WriteLine("{0}", factors.Aggregate((product, factor) => product * factor));
    }

    static public List<ulong> Overlap(List<ulong> a, List<ulong> b) {
        for (int i = 0; i < b.Count; i++) {
            a.Remove(b[i]);
        }

        a.AddRange(b);

        return a;
    }

    static public List<ulong> PrimeFactors(ulong n) {
        bool found = false;

        ulong v = 2;

        for (ulong i = 2; i < n - 1; i++) {
            if (n % i == 0) {
                found = true;

                v = i;

                break;
            }
        }

        List<ulong> result = new List<ulong>();

        if (found) {
            result.Add(v);

            result = result.Concat(PrimeFactors(n / v)).ToList();
        } else {
            result.Add(n);
        }

        return result;
    }
}
