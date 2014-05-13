defmodule FizzBuzzWithCase do

  def fizzbuzz(n) do
    _fizzbuzz(0, n)
  end

  defp _fizzbuzz(n, 0) do
  end

  defp _fizzbuzz(n, left) do
    case {rem(n, 3), rem(n, 5)} do
      {0, 0} ->
        IO.puts "FizzBuzz"
      {0, _} ->
        IO.puts "Fizz"
      {_, 0} ->
        IO.puts "Buzz"
      {_, _} ->
        IO.puts n
    end
    _fizzbuzz(n + 1, left - 1)
  end

end


FizzBuzzWithCase.fizzbuzz(20)