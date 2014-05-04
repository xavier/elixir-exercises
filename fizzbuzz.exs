
fizzbuzz = fn
  (0, 0, _) -> "FizzBuzz"
  (0, _, _) -> "Fizz"
  (_, 0, _) -> "Buzz"
  (_, _, x) -> x
end

fizzbuzzer = fn (n) -> fizzbuzz.(rem(n, 3), rem(n, 5), n) end

IO.puts fizzbuzzer.(10)
IO.puts fizzbuzzer.(11)
IO.puts fizzbuzzer.(12)
IO.puts fizzbuzzer.(13)
IO.puts fizzbuzzer.(14)
IO.puts fizzbuzzer.(15)
IO.puts fizzbuzzer.(16)
IO.puts fizzbuzzer.(17)