using System;

public class Euler {
    static public void Main() {
        ulong sumOfSquares = 0;

        ulong sum = 0;

        ulong squareOfSum = 0;

        for (ulong i = 1; i <= 100; i++) {
            sumOfSquares += (i * i);

            sum += i;
        }

        squareOfSum = sum * sum;

        Console.WriteLine("{0}", squareOfSum - sumOfSquares);
    }
}
