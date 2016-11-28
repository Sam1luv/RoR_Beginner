puts 'Укажите первый коэффициент'
a = gets.chomp.to_f

puts 'Укажите второй коэффициент'
b = gets.chomp.to_f

puts 'Укажите третий коэффициент'
c = gets.chomp.to_f

d = b**2 - 4 * a * c

if d > 0
  sqrt_root = Math.sqrt(d)
  puts "#{d}, x1 = #{(-b + sqrt_root / (2 * a))}, x2 = #{(-b - sqrt_root / (2 * a))}"
elsif d.zero?
  puts "#{d}, x = #{-b / (2 * a)}"
else
  puts "#{d}, Корней нет"
end
