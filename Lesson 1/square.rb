puts 'Укажите первый коэффициент'
a = gets.chomp.to_i

puts 'Укажите второй коэффициент'
b = gets.chomp.to_i

puts 'Укажите третий коэффициент'
c = gets.chomp.to_i

d = b**2 - 4 * (a * c)

if d > 0
  puts "#{d}, x1 = #{(- b + Math.sqrt(d) / (2 * a))}, x2 = #{(- b - Math.sqrt(d) / (2 * a))}"
elsif d == 0
  puts "#{d}, x = #{-b / (2 * a)}"
else
  puts "#{d}, Корней нет"
end

