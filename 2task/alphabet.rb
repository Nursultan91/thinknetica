alphabet = ('A'..'Z').to_a
vowels_array = %w[A E I O U Y]
vowels_hash = {}

alphabet.each_with_index {|letter, index| vowels_hash[letter.to_sym] = index if vowels_array.include?(letter)}
puts vowels_hash
