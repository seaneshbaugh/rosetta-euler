object Euler {
  def main(args: Array[String]): Unit = {
    println((1 until 21).map(x => primeFactors(x)).reduceLeft((x, y) => overlap(x, y)).reduceLeft((x, y) => x * y))
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

  def removeFirst[T](list: List[T])(pred: (T) => Boolean): List[T] = {
    val (before, after) = list span (x => !pred(x))

    before ::: after.drop(1)
  }

  def overlap[T](a: List[T], b: List[T]): List[T] = {
    def o[T](x: List[T], y: List[T]): List[T] = {
      if (x.length == 0) {
        y
      } else {
        o(x.tail, removeFirst(y) { _ == x.head })
      }
    }

    a ++ o(a, b)
  }
}
