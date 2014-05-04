defmodule MyLists do

  def mapsum([], _), do: 0
  def mapsum([head|tail], fun), do: fun.(head) + mapsum(tail, fun)

  def max([]), do: nil
  def max([head|tail]), do: _max(tail, head)

  defp _max([], current_max), do: current_max
  defp _max([head|tail], current_max) when head > current_max do
    _max(tail, head)
  end
  defp _max([head|tail], current_max) when head < current_max do
    _max(tail, current_max)
  end

end


IO.puts MyLists.mapsum([1, 2, 3], &(&1 * &1))

IO.puts MyLists.max([])
IO.puts MyLists.max([1])
IO.puts MyLists.max([1, 2])
IO.puts MyLists.max([1, 2, 3])
IO.puts MyLists.max([3, 2, 1])

