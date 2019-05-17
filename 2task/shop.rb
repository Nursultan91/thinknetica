basket = {}
loop do
  print "Введите название товара "
  goods_name = gets.chomp
  break if goods_name.downcase == "stop"
  print "Введите количество товара "
  count = gets.to_i
  print "Введите цену товара "
  price = gets.to_i
  basket[goods_name.to_sym] = {count: count, price: price}
end

puts basket

total_price = 0

basket.each do |good, info|
  item_total = info[:count] * info[:price]
  puts "#{good} - #{item_total}"
  total_price += item_total
end

puts total_price
