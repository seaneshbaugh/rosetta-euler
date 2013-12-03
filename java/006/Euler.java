public class Euler {
    public static void main(String[] args) {
        long sumOfSquares = 0;

        long sum = 0;

        long squareOfSum = 0;

        for (long i = 1; i <= 100; i++) {
            sumOfSquares += i * i;

            sum += i;
        }

        squareOfSum = sum * sum;

        System.out.format("%d%n", squareOfSum - sumOfSquares);
    }
}
