class Card
  attr_accessor :suit, :value

  SUITS = %w[C D H S].freeze

  VALUES = %w[2 3 4 5 6 7 8 9 T J Q K A].freeze

  VALUE_MAP = { '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9, 'T' => 10, 'J' => 11, 'Q' => 12, 'K' => 13, 'A' => 14 }.freeze

  def initialize(card_text)
    self.suit = card_text.split('').last.upcase

    raise ArgumentError unless SUITS.include?(suit)

    self.value = card_text.chop.upcase

    raise ArgumentError unless VALUES.include?(value)
  end

  def to_s(verbose = false)
    value_text = {
      '2' => 'Two',
      '3' => 'Three',
      '4' => 'Four',
      '5' => 'Five',
      '6' => 'Six',
      '7' => 'Seven',
      '8' => 'Eight',
      '9' => 'Nine',
      'T' => 'Ten',
      'J' => 'Jack',
      'Q' => 'Queen',
      'K' => 'King',
      'A' => 'Ace'
    }

    suit_text = {
      'C' => 'Clubs',
      'D' => 'Diamonds',
      'H' => 'Hearts',
      'S' => 'Spades'
    }

    if verbose
      "#{value_text[value]} of #{suit_text[suit]}"
    else
      "#{value}#{suit}"
    end
  end

  def to_i
    Card::VALUE_MAP[value]
  end

  def inspect
    to_s
  end

  def ==(other)
    VALUE_MAP[value] == VALUE_MAP[other.value]
  end

  def !=(other)
    VALUE_MAP[value] != VALUE_MAP[other.value]
  end

  def >(other)
    VALUE_MAP[value] > VALUE_MAP[other.value]
  end

  def >=(other)
    VALUE_MAP[value] >= VALUE_MAP[other.value]
  end

  def <(other)
    VALUE_MAP[value] < VALUE_MAP[other.value]
  end

  def <=(other)
    VALUE_MAP[value] <= VALUE_MAP[other.value]
  end

  def <=>(other)
    if self < other
      -1
    elsif self == other
      0
    else
      1
    end
  end
end

class Hand
  attr_accessor :cards

  RANK_ORDER = %i[royal_flush? straight_flush? four_of_a_kind? full_house? flush? straight? three_of_a_kind? two_pairs? one_pair?].freeze

  def initialize(cards)
    raise ArgumentError if cards.length != 5

    self.cards = cards
  end

  def to_s
    "[#{cards.sort.map(&:to_s).join(', ')}]"
  end

  def one_pair?
    cards.group_by(&:value).map { |_value, cards| cards.length }.count(2) == 1
  end

  def two_pairs?
    cards.group_by(&:value).map { |_value, cards| cards.length }.count(2) == 2
  end

  def three_of_a_kind?
    cards.group_by(&:value).map { |_value, cards| cards.length }.count(3) == 1
  end

  def straight?
    cards.sort.map(&:to_i).each_cons(2).all? { |a, b| a + 1 == b }
  end

  def flush?
    cards.group_by(&:suit).length == 1
  end

  def full_house?
    three_of_a_kind? && one_pair?
  end

  def four_of_a_kind?
    number_of_cards_of_each_value = cards.group_by(&:value).map { |_value, cards| cards.length }

    number_of_cards_of_each_value.count(4) == 1
  end

  def straight_flush?
    straight? && flush?
  end

  def royal_flush?
    cards.sort.map(&:to_i) == [10, 11, 12, 13, 14] && flush?
  end

  def compare_highest_card(other)
    a = cards.map(&:to_i).sort

    b = other.cards.map(&:to_i).sort

    result = nil

    loop do
      break if (!result.nil? && result != 0) || a.empty? || b.empty?

      result = a.max <=> b.max

      a.pop

      b.pop
    end

    result
  end

  def compare_lowest_set(other, length)
    raise ArgumentError if length < 2 || length > 4

    cards.group_by(&:value).select { |_, v| v.length == length }.map { |_, v| v.first }.min <=> other.cards.group_by(&:value).select { |_, v| v.length == length }.map { |_, v| v.first }.min
  end

  def compare_highest_set(other, length)
    raise ArgumentError if length < 2 || length > 4

    cards.group_by(&:value).select { |_, v| v.length == length }.map { |_, v| v.first }.max <=> other.cards.group_by(&:value).select { |_, v| v.length == length }.map { |_, v| v.first }.max
  end

  def <=>(other)
    this_hand_rank = RANK_ORDER.length

    other_hand_rank = RANK_ORDER.length

    RANK_ORDER.each do |rank_method|
      break if send(rank_method)

      this_hand_rank -= 1
    end

    RANK_ORDER.each do |rank_method|
      break if other.send(rank_method)

      other_hand_rank -= 1
    end

    if other_hand_rank > this_hand_rank
      -1
    elsif this_hand_rank > other_hand_rank
      1
    else
      result = nil

      case this_hand_rank
      when 0
        result = compare_highest_card(other)
      when 1
        result = compare_highest_set(other, 2)

        result = compare_highest_card(other) if result == 0
      when 2
        result = compare_highest_set(other, 2)

        result = compare_lowest_set(other, 2) if result == 0

        result = compare_highest_card(other) if result == 0
      when 3
        result = compare_highest_set(other, 3)

        result = compare_highest_card(other) if result == 0
      when 4
        result = compare_highest_card(other)
      when 5
        result = compare_highest_card(other)
      when 6
        result = compare_highest_set(other, 3)

        result = compare_highest_set(other, 2) if result == 0
      when 7
        result = compare_highest_set(other, 4)

        result = compare_highest_card(other) if result == 0
      when 8
        result = compare_highest_card(other)
      else
        result = 0
      end

      result
    end
  end
end

hands = File.readlines(File.expand_path(File.join(__dir__, '..', '..', 'files', 'poker.txt')))

player_1_wins = 0

player_2_wins = 0

ties = 0

hands.each do |hand_text|
  cards = hand_text.split(' ').map { |card_text| Card.new(card_text) }

  player_1_hand = Hand.new(cards.first(5))

  player_2_hand = Hand.new(cards.last(5))

  comparison = player_1_hand <=> player_2_hand

  if comparison == -1
    player_2_wins += 1
  elsif comparison == 1
    player_1_wins += 1
  else
    ties += 1
  end
end

puts player_1_wins
