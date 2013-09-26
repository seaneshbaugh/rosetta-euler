public class Euler {
    public static def prime_factors(n) {
        def found = false

        def v = 2L

        def i = 2L

        while (i < n - 1L && !found) {
            if (n % i == 0) {
                found = true

                v = i
            }

            i++
        }

        def result = []

        if (found) {
            result.push(v)

            result = result + prime_factors((Long)(n / v))
        } else {
            result.push(n)
        }

        return result
    }
}

println Euler.prime_factors(600851475143L).max()
