object Euler {
  def main(args: Array[String]) {
    println((100 until 1000).map(x => (100 until 1000).map(y => x * y)).flatten.filter(x => x.toString == x.toString.reverse).max);
  }
}
