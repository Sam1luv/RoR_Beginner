puts 'Введите число'
day = gets.chomp.to_i

puts 'Введите месяц'
month = gets.chomp.to_i

puts 'Введите год'
year = gets.chomp.to_i

puts 'Вы ввели неверные значения' if day > 31 || month > 12

month_days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

month_days[1] = 29 if (year % 4).zero? && (year % 100).nonzero? || (year % 400).zero?

order = 0

unless month < 1
  (1..month - 1).each do |index|
    order += month_days[index]
  end
end

order_number = order + day

puts "Порядковый номер : #{order_number}"
