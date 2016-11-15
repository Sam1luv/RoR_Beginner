product_list = {}
loop do
  puts "Введите наименование товара"
  product = gets.chomp

  break if product == 'стоп'

  puts "Введите цену за единицу товара"
  price = gets.chomp

  puts "Введите количество товара"
  number = gets.chomp

  product_list[product.to_sym] = {price: price.to_f, number: number.to_f}
end

sum = 0
product_list.each do | key, value|
  product_sum = product_list[:price] * product_list[:number]
  puts "Сумма за товар : #{key} - #{product_sum}"
  sum += product_sum
end

puts product_list

puts "Общая сумма покупок составляет : #{sum}"
