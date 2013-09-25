using System;
using System.Collections.Generic;
using System.Linq;

public class Euler {
    static public void Main() {
        List<ulong> primeFactors = PrimeFactors(600851475143);

        Console.WriteLine("{0}", primeFactors.Max(x => x));
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
