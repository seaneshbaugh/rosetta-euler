using System;
using System.Collections.Generic;
using System.Linq;

public class Euler {
    static public void Main() {
        List<ulong> palindromes = new List<ulong>();

        for (ulong x = 100; x <= 999; x++) {
            for (ulong y = 100; y <= 999; y++) {
                ulong product = x * y;

                String s = product.ToString();

                if (s == String.Concat(Enumerable.Reverse(s))) {
                    palindromes.Add(product);
                }
            }
        }

        Console.WriteLine("{0}", palindromes.Max(x => x));
    }
}
