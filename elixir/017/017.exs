defmodule Euler do
  @under_twenty ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"]

  @tens ["twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"]

  @denom ["thousand", "million", "billion", "trillion", "quadrillion", "quintillion", "sextillion", "septillion", "octillion", "nonillion", "decillion", "undecillion", "duodecillion", "tredecillion", "quattuordecillion", "sexdecillion", "septendecillion", "octodecillion", "novemdecillion", "vigintillion"]

  def to_english(x) when is_integer(x) and x < 0 do
    "negative " <> to_english(-x)
  end

  def to_english(x) when is_integer(x) and x < 20 do
    Enum.at(@under_twenty, x)
  end

  def to_english(x) when is_integer(x) and x < 100 do
    if rem(x, 10) == 0 do
      Enum.at(@tens, div(x, 10) - 2)
    else
      Enum.at(@tens, div(x, 10) - 2) <> "-" <> Enum.at(@under_twenty, rem(x, 10))
    end
  end

  def to_english(x) when is_integer(x) and x < 1000 do
    result = ""

    d = div(x, 100)

    r = rem(x, 100)

    if d > 0 do
      result = Enum.at(@under_twenty, d) <> " hundred"

      if r > 0 do
        result = result <> " and "
      end
    end

    if r > 0 do
      result = result <> to_english(r)
    end

    result
  end

  def to_english(x) when x < is_integer(x) and x < 1000000000000000000000000000000000000000000000000000000000000000000 do
    denoms(x, 0)
  end

  defp denoms(x, v) when v < length(@denom) do
    didx = v - 1

    dval = round(:math.pow(1000, v))

    if dval > x do
      mod = round(:math.pow(1000, didx))

      l = div(x, mod)

      r = x - (l * mod)

      result = to_english(l) <> " " <> Enum.at(@denom, didx - 1)

      if r > 0 do
        result = result <> ", " <> to_english(r)
      end

      result
    else
      denoms(x, v + 1)
    end
  end
end

IO.puts 1..1000 |> Enum.map(fn x -> Euler.to_english(x) end) |> Enum.join |> :re.replace('\s|-', '', [:global, {:return, :list}]) |> length |> to_string
