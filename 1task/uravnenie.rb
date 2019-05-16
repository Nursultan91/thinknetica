puts "Введите коэффициент а"
a = gets.chomp.to_i
puts "Введите коэффициент b"
b = gets.chomp.to_i
puts "Введите коэффициент c"
c = gets.chomp.to_i

puts "Ваше уравнение #{a}x^2 + #{b}x + #{c} = 0"
discriminant = b**2 - 4*a*c
puts "Дискриминант равен #{discriminant}"

if discriminant > 0
  discriminant_sqrt = Math.sqrt(discriminant)
  x1 = (-b + discriminant_sqrt) / (2.0 * a)
  x2 = (-b - discriminant_sqrt) / (2.0 * a)
  puts "Корни уравнения #{x1}, #{x2}"
elsif discriminant == 0
 x = (-b) / (2 * a)
  puts "Корень уравнения #{x}"
else
  puts "Корней нет"
end
