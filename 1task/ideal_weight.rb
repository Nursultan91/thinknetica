puts "Введите ваше имя"
name = gets.chomp
puts "Введите ваш рост"
weight = gets.to_i

ideal_weight = weight - 110

if ideal_weight > 0
  puts "#{name}, ваш идевльный вес #{ideal_weight}"
else
  puts "Ваш вес уже оптимален"
end
