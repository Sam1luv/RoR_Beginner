def fibonacci(n)
  if n <= 2
    1
  else
    fibonacci(n - 1) + fibonacci(n - 2)
  end
end

fib_numbers = []
(1..20).each do |n|
  fib_numbers .push(fibonacci(n)) if fibonacci(n) < 100
end

puts fib_numbers.to_s
