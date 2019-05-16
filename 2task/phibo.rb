phibo = [0, 1]
while phibo.last <= 100 do
  phibo_last_element = phibo[-1] + phibo[-2]
  break if phibo_last_element > 100
  phibo << phibo_last_element
end

puts "#{phibo}"
