import java.util.List;
import java.util.ArrayList;

public class Euler {
  public static void main(String[] args) {
    List<Integer> fibs = new ArrayList<Integer>();

    fibs.add(0);

    fibs.add(1);

    while (fibs.get(fibs.size() - 1) + fibs.get(fibs.size() - 2) < 4000000) {
      fibs.add(fibs.get(fibs.size() - 1) + fibs.get(fibs.size() - 2));
    }

    int sum = 0;

    for (int i = 0; i < fibs.size(); i++) {
      if (fibs.get(i) % 2 == 0) {
        sum += fibs.get(i);
      }
    }

    System.out.format("%d%n", sum);
  }
}
