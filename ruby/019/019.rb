day_index = 0

sundays_on_first_of_month = 0

(1900..2000).each do |year|
  days_in_each_month = { 1 => 31, 2 => (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0) ? 29 : 28, 3 => 31, 4 => 30, 5 => 31, 6 => 30, 7 => 31, 8 => 31, 9 => 30, 10 => 31, 11 => 30, 12 => 31 }

  (1..12).each do |month|
    (1..days_in_each_month[month]).each do |day|
      sundays_on_first_of_month += 1 if year > 1900 && year < 2001 && day_index == 6 && day == 1

      day_index += 1

      day_index = 0 if day_index > 6
    end
  end
end

puts sundays_on_first_of_month
