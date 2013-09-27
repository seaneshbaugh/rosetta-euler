object Euler {
  def main(args: Array[String]) {
    println(primeFactors(600851475143L).max);
  }

  def primeFactors(n: Long): List[Long] = {
    def pf(tuple: (Long, Long)): List[Long] = {
      tuple match {
        case (n, p) if (n < p * p)  => List[Long](n)
        case (n, p) if (n % p == 0) => List[Long](p) ++ pf((n / p, p))
        case (n, p)                 => pf((n, p + 1))
      }
    }
    pf((n, 2))
  }
}
