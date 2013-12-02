import java.util.List;
import java.util.ArrayList;
import java.util.Collections;

public class Euler {
    public static void main(String[] args) {
        List<List<Long>> factorLists = new ArrayList<List<Long>>(); ;

        for (long i = 1; i < 21; i++) {
            factorLists.add(primeFactors(i));
        }

        List<Long> factors = new ArrayList<Long>();

        for (List<Long> factorList : factorLists) {
            factors = overlap(factors, factorList);
        }

        Long product = 1L;

        for (Long n : factors) {
            product *= n;
        }

        System.out.format("%d%n", product);
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

    public static List<Long> overlap(List<Long> a, List<Long> b) {
        for (Long n : b) {
            a.remove(n);
        }

        a.addAll(b);

        Collections.sort(a);

        return a;
    }
}
