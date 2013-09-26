import java.util.List;
import java.util.ArrayList;
import java.util.Collections;

public class Euler {
  public static void main(String[] args) {
    System.out.format("%d%n", Collections.max(primeFactors(600851475143L)));
  }

  public static List<Long> primeFactors(Long n) {
    boolean found = false;

    long v = 2;

    for (long i = 2; i < n - 1; i++) {
      if (n % i == 0) {
        found = true;

        v = i;

        break;
      }
    }

    List<Long> factors = new ArrayList<Long>();

    if (found) {
      factors.add(v);

      factors.addAll(primeFactors(n / v));
    } else {
      factors.add(n);
    }

    return factors;
  }
}
