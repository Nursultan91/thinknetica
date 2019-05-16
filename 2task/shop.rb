basket = {}
loop do
  print "Введите название товара "
  goods_name = gets.chomp
  break if goods_name == "stop"
  print "Введите количество товара "
  goods_count = gets.to_i
  print "Введите цену товара "
  goods_price = gets.to_i
  basket[goods_name.to_s] = {goods_count.to_s => goods_price}
end

puts basket

basket.each do |good, amount|
  amount.each { |count, price| puts "#{good} - #{count.to_i * price.to_i}" }
end
