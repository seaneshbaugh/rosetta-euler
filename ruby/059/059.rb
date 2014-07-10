class Array
  def repeating_key_xor_decrypt(key)
    self.each_slice(key.length).to_a.map { |s| s.zip(key).map { |a, b| a ^ b } }.flatten
  end
end

class String
  def score_character
    raise ArgumentError if self.length != 1

    alpha_numeric_characters = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'

    other_common_characters = "\t\n\r !\"#$%&'()*+,-./:;<=>?@\\"

    less_common_characters = '[]^_`{|}~'

    if alpha_numeric_characters.include?(self)
      10
    elsif other_common_characters.include?(self)
      3
    elsif less_common_characters.include?(self)
      0
    else
      -1000
    end
  end

  def score
    base_score = self.split('').map { |c| c.score_character }.inject(:+)

    common_trigrams = [['the', 16], ['and', 15], ['tha', 14], ['ent', 13], ['ing', 12], ['ion', 11], ['tio', 10], ['for', 9], ['nde', 8], ['has', 7], ['nce', 6], ['edt', 5], ['tis', 4], ['oft', 3], ['sth', 2], ['men', 1]]

    trigram_score = common_trigrams.map { |trigram| self.split(trigram.first).length * trigram.last }.inject(:+)

    base_score + trigram_score
  end
end

contents = File.read('../../files/cipher1.txt').split(',').map { |c| c.to_i }

decrypted_strings = ('aaa'..'zzz').to_a.map do |key|
  string = contents.repeating_key_xor_decrypt(key.split('').map { |c| c.ord }).map { |c| c.chr }.join('')

  { key: key, string: string, score: string.score }
end

puts decrypted_strings.max_by { |s| s[:score] }[:string].split('').map { |c| c.ord }.inject(:+)
