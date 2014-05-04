defmodule SumWithoutAccumulator do

  def sum([]), do: 0
  def sum([head|tail]), do: head + sum(tail)

end

IO.puts SumWithoutAccumulator.sum([1, 2, 3, 10])