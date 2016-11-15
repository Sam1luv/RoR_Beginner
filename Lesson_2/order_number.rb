puts "Введите число"
day = gets.chomp.to_i

puts "Введите месяц"
month = gets.chomp.to_i

puts "Введите год"
year = gets.chomp.to_i

if day > 31 || month > 12
  puts "Вы ввели неверные значения"
end

month_days = {
  1 => 31,
  2 => 28,
  3 => 31,
  4 => 30,
  5 => 31,
  6 => 30,
  7 => 31,
  8 => 31,
  9 => 30,
  10 => 31,
  11 => 30,
  12 => 31
}

if year % 4 == 0 && year % 100 != 0 || year % 400 ==0
  month_days[2] = 29
else
  month_days[2] = 28
end

order = 0

unless month < 1
  (1..month - 1).each do | index |
    order = order + month_days[index]
  end
end


  order_number = order + day

  puts "Порядковый номер : #{order_number}"

