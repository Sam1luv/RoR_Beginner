puts 'Укажите первую сторону треугольника'
a = gets.chomp.to_f

puts 'Укажите вторую сторону треугольника'
b = gets.chomp.to_f

puts 'Укажите третью сторону треугольника'
c = gets.chomp.to_f

square_a = a**2
square_b = b**2
hypotenuse = square_a + square_b

if hypotenuse == square_a + square_a
  puts 'Треугольник является прямоугольным'
elsif hypotenuse == square_a + square_a && (a == b || a == c || c == b)
  puts 'Треугольник является прямоугольным и равнобедренным'
elsif a == b && b == c
  puts 'Треугольник является равнобедренным и равносторонним'
elsif  a == b || a == c || c == b
  puts 'Треугольник является равнобедренным'
else
  puts 'Треугольник является разносторонним'
end
