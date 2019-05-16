puts "Введите первую соторону треугольника"
a = gets.chomp.to_i
puts "Введите вторую соторону треугольника"
b = gets.chomp.to_i
puts "Введите третью соторону треугольника"
c = gets.chomp.to_i

triangle_sides = [a, b, c].sort
if triangle_sides.uniq.length == 1
  puts "Треугольник равнобедренный и равносторонний но не прямоугольный"
elsif triangle_sides.uniq.length == 2
  if (triangle_sides.first**2)*2 == triangle_sides.last**2
    puts "Треугольник Прямоугольный и равнобедренный но не равносторонний"
  else
    puts "Треугольник равнобедренный"
  end
elsif triangle_sides.first**2 + triangle_sides[1]**2 == triangle_sides.last**2
  puts "Треугольник прямоугольный"
else
  puts "простой треугольник"
end