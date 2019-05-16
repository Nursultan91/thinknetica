print "Введите день (число) "
user_day = gets.to_i
print "Введите месяц (номер) "
user_month = gets.to_i
print "Введите год "
user_year = gets.to_i

puts "Дата которую вы ввели #{user_day}-е число, #{user_month}-го месяца, #{user_year}-го года"

month_days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
def is_leap(year)
  (year % 4 == 0 && year % 100 != 0) || year % 400 == 0 ? true : false
end

month_days[1] = 29 if is_leap(user_year)

user_month == 1 ? sum_days = user_day : sum_days = month_days.take(user_month - 1).reduce(:+) + user_day

puts "#{sum_days}-м днем в году является дата которую вы ввели"
