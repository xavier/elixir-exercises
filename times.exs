defmodule Times do

  def double(x) do
    x * 2
  end

  def triple(x) do
    x * 3
  end

  def quadruple(x) do
    double(double(x))
  end

end

IO.puts Times.double(3)
IO.puts Times.triple(3)
IO.puts Times.quadruple(3)