defmodule Cons do
  def each_cons(list, n // 2) do
    _each_cons(list, n, [])
  end

  defp _each_cons(list,  n, result) when length(list) < n do
    Enum.reverse result
  end

  defp _each_cons(list = [_ | tail], n, result) do
    _each_cons(tail, n, [Enum.take(list, n)|result])
  end
end

defmodule Euler do
  def mung(number_string), do: :re.replace(number_string, '\n', '', [:global, {:return, :list}])

  def char_lists_to_strings(char_lists), do: char_lists |> Enum.map(&(String.from_char_list!(&1)))

  def strings_to_codepoints(strings), do: strings |> Enum.map(&(String.codepoints(&1)))

  def codepoints_to_digits(codepoint_lists), do: codepoint_lists |> Enum.map(fn codepoints -> codepoints |> Enum.map(&(String.to_integer(&1) |> elem(0))) end)

  def digit_products(digit_lists), do: digit_lists |> Enum.map(fn digit_list -> digit_list |> Enum.reduce(1, &(&1 * &2)) end)

  def greatest_product_of_consecutive_digits(x, digits) when digits > 1 do
    x |> mung
    |> Cons.each_cons(digits)
    |> char_lists_to_strings
    |> strings_to_codepoints
    |> codepoints_to_digits
    |> digit_products
    |> Enum.max
  end
end

x = """
73167176531330624919225119674426574742355349194934
96983520312774506326239578318016984801869478851843
85861560789112949495459501737958331952853208805511
12540698747158523863050715693290963295227443043557
66896648950445244523161731856403098711121722383113
62229893423380308135336276614282806444486645238749
30358907296290491560440772390713810515859307960866
70172427121883998797908792274921901699720888093776
65727333001053367881220235421809751254540594752243
52584907711670556013604839586446706324415722155397
53697817977846174064955149290862569321978468622482
83972241375657056057490261407972968652414535100474
82166370484403199890008895243450658541227588666881
16427171479924442928230863465674813919123162824586
17866458359124566529476545682848912883142607690042
24219022671055626321111109370544217506941658960408
07198403850962455444362981230987879927244284909188
84580156166097919133875499200524063689912560717606
05886116467109405077541002256983155200055935729725
71636269561882670428252483600823257530420752963450
"""

#IO.puts :re.replace(x, '\n', '', [:global, {:return, :list}]) |> Cons.each_cons(5) |> Enum.map(&(String.from_char_list!(&1))) |> Enum.map(&(String.codepoints(&1))) |> Enum.map(fn x -> x |> Enum.map(&(String.to_integer(&1) |> elem(0))) |> Enum.reduce(1, &(&1 * &2)) end) |> Enum.sort |> List.last

IO.puts x |> Euler.greatest_product_of_consecutive_digits(5)
