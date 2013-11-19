object Euler {
  def main(args: Array[String]) {
    println(math.pow((1 until 101).foldLeft(0)(_ + _), 2).toLong - ((1 until 101).map(x => x * x).foldLeft(0)(_ + _)))
  }
}
