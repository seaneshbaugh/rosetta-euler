import java.util.List;
import java.util.ArrayList;
import java.util.Collections;

public class Euler {
  public static void main(String[] args) {
    List<Long> palindromes = new ArrayList<Long>();

    for (long x = 100; x <= 999; x++) {
      for (long y = 100; y <= 999; y++) {
        long product = x * y;

        String s = Long.toString(product);

        String r = new StringBuffer(s).reverse().toString();

        if (s.equals(r)) {
          palindromes.add(product);
        }
      }
    }

    System.out.format("%d%n", Collections.max(palindromes));
  }
}
