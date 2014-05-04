
prefix = fn (title) -> (fn (name) -> "#{title} #{name}" end) end

mrs = prefix.("Mrs.")
IO.puts mrs.("Robinson")