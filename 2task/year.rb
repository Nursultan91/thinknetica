print "Введите день (число) "
user_day = gets.to_i
print "Введите месяц (номер) "
user_month = gets.to_i
print "Введите год "
user_year = gets.to_i

user_year % 4 == 0 ? feb_day = 29 : feb_day = 28

puts "Дата которую вы ввели #{user_day}, #{user_month}, #{user_year}"

monthes = {january: 31, february: feb_day, march: 31, april: 30, may: 31, june: 30, july: 31, august: 31, september: 30, october: 31, november: 30, december: 31}
month_days = []

monthes.each {|month, days| month_days<< days }

puts "#{month_days}"

searched_day_monthes = []

month_days[0..user_month-1].each do |day_in_month|
  searched_day_monthes << day_in_month
end

puts "#{searched_day_monthes}"

sum_days = user_day
searched_day_monthes.each {|a| sum_days += a }

puts "#{sum_days}-м днем в году является дата которую вы ввели"