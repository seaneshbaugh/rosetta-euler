using System;
using System.Collections.Generic;
using System.Linq;

public class Euler {
    static public void Main() {
        List<int> fibs = new List<int>() { 0, 1 };

        while (fibs[fibs.Count - 1] + fibs[fibs.Count - 2] < 4000000) {
            fibs.Add(fibs[fibs.Count - 1] + fibs[fibs.Count - 2]);
        }

        Console.WriteLine("{0}", fibs.Where(x => x % 2 == 0).Sum());
    }
}
