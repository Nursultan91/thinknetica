phibo = [0, 1]
next_element = 1
while next_element <= 100 do
  phibo << next_element
  next_element = phibo[-1] + phibo[-2]
end

puts "#{phibo}"
