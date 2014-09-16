defmodule Euler do
  def sundays_on_first_of_month_between(current_year, end_year) when is_integer(current_year) and is_integer(end_year) and current_year >= 0 and current_year <= end_year do
    count_sundays(day_index_of_january_first(current_year), days_in_each_month(current_year), 1) + sundays_on_first_of_month_between(current_year + 1, end_year)
  end

  def sundays_on_first_of_month_between(current_year, end_year) when is_integer(current_year) and is_integer(end_year) and current_year > end_year do
    0
  end

  defp count_sundays(day_index, days_in_each_month, month) do
    if day_index == 0 do
      days = 1
    else
      days = 0
    end

    if month < 12 do
      days + count_sundays(rem(day_index + HashDict.get(days_in_each_month, month), 7), days_in_each_month, month + 1)
    else
      days
    end
  end

  def day_index_of_january_first(year) do
    if (rem(year, 4) == 0 && rem(year, 100) != 0) || (rem(year, 400) == 0) do
      days_from_january_first_to_april_fourth = 94
    else
      days_from_january_first_to_april_fourth = 93
    end

    doomsday(year) - rem(days_from_january_first_to_april_fourth, 7)
  end

  def doomsday(year) do
    t = rem(year, 100)

    if rem(t, 2) != 0 do
      t = t + 11
    end

    t = div(t, 2)

    if rem(t, 2) != 0 do
      t = t + 11
    end

    t = 7 - rem(t, 7)

    rem(t + gregorian_anchor_day(year), 7)
  end

  defp gregorian_anchor_day(year) do
    century = floor(year / 100)

    # Tuesday = 2
    rem(5 * rem(century, 4), 7) + 2
  end

  defp days_in_each_month(year) when is_integer(year) do
    if (rem(year, 4) == 0 && rem(year, 100) != 0) || (rem(year, 400) == 0) do
      days_in_february = 29
    else
      days_in_february = 28
    end

    Enum.into([{1, 31}, {2, days_in_february}, {3, 31}, {4, 30}, {5, 31}, {6, 30}, {7, 31}, {8, 31}, {9, 30}, {10, 31}, {11, 30}, {12, 31}], HashDict.new)
  end

  def floor(x) when is_number(x) and x < 0 do
    t = trunc(x)

    if x - t == 0 do
      t
    else
      t - 1
    end
  end

  def floor(x) when is_number(x) do
    trunc(x)
  end
end

IO.puts Euler.sundays_on_first_of_month_between(1901, 2000) |> to_string
