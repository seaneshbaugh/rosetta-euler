object Euler {
  def main(args: Array[String]): Unit = {
    lazy val fibs: LazyList[Int] = 0 #:: 1 #:: fibs.zip(fibs.tail).map { x => x._1 + x._2 }

    println(fibs.takeWhile { x => x < 4000000 }.filter(x => x % 2 == 0).foldLeft(0)(_+_))
  }
}
