print "Введите день (число) "
user_day = gets.to_i
print "Введите месяц (номер) "
user_month = gets.to_i
print "Введите год "
user_year = gets.to_i

puts "Дата которую вы ввели #{user_day}-е число, #{user_month}-го месяца, #{user_year}-го года"

month_days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
def leap_year?(year)
  (year % 4 == 0 && year % 100 != 0) || year % 400 == 0
end

month_days[1] = 29 if leap_year?(user_year)

day_order = user_day + month_days.take(user_month - 1).reduce(0, :+)

puts "#{day_order}-м днем в году является дата которую вы ввели"
