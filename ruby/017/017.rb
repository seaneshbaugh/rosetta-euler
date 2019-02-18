class Numeric
  def to_english
    under_twenty = %w[zero one two three four five six seven eight nine ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen]

    tens = %w[twenty thirty forty fifty sixty seventy eighty ninety]

    denom = %w[thousand million billion trillion quadrillion quintillion sextillion septillion octillion nonillion decillion undecillion duodecillion tredecillion quattuordecillion sexdecillion septendecillion octodecillion novemdecillion vigintillion]

    if self < 0
      "negative #{(-self).to_engish}"
    elsif self < 20
      under_twenty[self]
    elsif self < 100
      result = ''

      tens.length.times do |v|
        cap = tens[v]

        val = 20 + 10 * v

        next unless val + 10 > self

        result = if self % 10 != 0
                   "#{cap}-#{under_twenty[self % 10]}"
                 else
                   cap
                 end

        break
      end

      result
    elsif self < 1000
      result = ''

      rem = self / 100

      mod = self % 100

      if rem > 0
        result = "#{under_twenty[rem]} hundred"

        result += ' and ' if mod > 0
      end

      result += mod.to_english if mod > 0

      result
    elsif self < 10**66
      result = ''

      denom.length.times do |v|
        didx = v - 1

        dval = 1000**v

        next unless dval > self

        mod = 1000**didx

        l = self / mod

        r = self - (l * mod)

        result = "#{l.to_english} #{denom[didx - 1]}"

        result += ", #{r.to_english}" if r > 0

        return result
      end

      result
    else
      to_s
    end
  end
end

puts (1..1000).map(&:to_english).inject(:+).gsub(/\s|-/, '').length
