puts "Введите первую соторону треугольника"
a = gets.chomp.to_i
puts "Введите вторую соторону треугольника"
b = gets.to_i
puts "Введите третью соторону треугольника"
c = gets.to_i

triangle_sides = [a, b, c].sort!

equilateral_triangle = triangle_sides.first == triangle_sides.last
right_triangle = triangle_sides.first**2 + triangle_sides[1]**2 == triangle_sides.last**2
right_isosceles_triangle = right_triangle && triangle_sides[0] == triangle_sides[1]
if equilateral_triangle
  puts "Треугольник равнобедренный и равносторонний но не прямоугольный"
elsif right_isosceles_triangle
  puts "Треугольник Прямоугольный и равнобедренный но не равносторонний"
elsif right_triangle
  puts "Треугольник прямоугольный"
else
  puts "простой треугольник"
end
