defmodule Ok do

  def ok!({:ok, data}), do: data
  def ok!(tuple = {_, data}), do: raise "This is not OK: #{inspect(tuple)}"

end

IO.inspect Ok.ok! File.open("data/sales.txt")

Ok.ok! File.open("data/bogus.txt")