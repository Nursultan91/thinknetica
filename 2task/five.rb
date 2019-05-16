ary = []
for i in 10..100
  ary << i if i%5 == 0
end

puts "#{ary}"