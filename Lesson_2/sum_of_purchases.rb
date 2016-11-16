product_list = {}
loop do
  puts "Введите наименование товара"
  product = gets.chomp.to_sym

  break if product == 'стоп'

  puts "Введите цену за единицу товара"
  price = gets.chomp.to_f

  puts "Введите количество товара"
  number = gets.chomp.to_f

  product_list[product] = {price: price, number: number}
end

sum = 0
product_list.each do | key, value|
  product_sum = product_list[:price] * product_list[:number]
  puts "Сумма за товар : #{key} - #{product_sum}"
  sum += product_sum
end

puts product_list

puts "Общая сумма покупок составляет : #{sum}"
