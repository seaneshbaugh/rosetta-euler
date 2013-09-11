public class Euler {
  public static void main(String[] args) {
    int sum = 0;

    for (int x = 1; x < 1000; x++) {
      if (x % 3 == 0 || x % 5 == 0) {
        sum += x;
      }
    }

    System.out.format("%d%n", sum);
  }
}
