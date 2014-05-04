

list = [1, 2, 3, 4]

IO.inspect Enum.map(list, &(&1 + 2))

Enum.each(list, &IO.inspect/1)