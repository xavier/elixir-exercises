defmodule Arithmetic do

  def sum(0), do: 0
  def sum(n), do: n + sum(n-1)

  def fast_sum(n), do: div(n*(n+1), 2) # :)

  def gcd(x, 0), do: x
  def gcd(x, y), do: gcd(y, rem(x, y))

end


IO.puts Arithmetic.sum(10)
IO.puts Arithmetic.fast_sum(10)

IO.puts Arithmetic.gcd(12, 18)
IO.puts Arithmetic.gcd(49, 17)