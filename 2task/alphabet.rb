alphabet = ('A'..'Z').to_a
vowels_array = ["A", "E", "I", "O", "U", "Y"]
vowels_hash = {}

vowels_array.each {|vowel| vowels_hash[vowel.to_s] = alphabet.index(vowel) }

puts vowels_hash