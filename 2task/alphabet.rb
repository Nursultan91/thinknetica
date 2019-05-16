alphabet = ('A'..'Z').to_a
vowels_array = %w[A E I O U Y]
vowels_hash = {}

alphabet.each.with_index(1) do |letter, index|
  vowels_hash[letter.to_sym] = index if vowels_array.include?(letter)
end

puts vowels_hash
