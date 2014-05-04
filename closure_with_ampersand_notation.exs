
prefix = fn (title) -> &("#{title} #{&1}") end

mrs = prefix.("Mrs.")
IO.puts mrs.("Robinson")