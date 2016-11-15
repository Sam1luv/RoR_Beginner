puts 'Как Ваше Имя?'
name = gets.chomp.capitalize

puts 'Пожалуйста, укажите ваш рост'
height = gets.chomp.to_i

ideal_weight = height - 110
if ideal_weight > 0
  puts "#{name}, твой идеальный вес #{ideal_weight} кг"
else
  puts "#{name}, Ваш вес уже оптимальный"
end
