def fibonacci(n)
  n <= 2 ? 1 : fibonacci(n - 1) + fibonacci(n - 2)
end

fib_numbers = []
n = 0
while n < 20 && fibonacci(n) < 100
  fib_numbers << fibonacci(n)
  n += 1
end

puts fib_numbers.to_s
