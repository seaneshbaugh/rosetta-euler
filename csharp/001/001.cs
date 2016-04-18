using System;
using System.Collections.Generic;
using System.Linq;

public class Euler {
	static public void Main() {
		Console.WriteLine("{0}", Enumerable.Range(1, 999).Where(x => x % 3 == 0 || x % 5 == 0).Sum());
	}
}
