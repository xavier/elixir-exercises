
IO.puts :io_lib.format("~.2f", [3.14159])

IO.puts System.get_env("SHELL")

IO.puts Path.extname("foo.txt")

IO.puts System.cwd

# http://expm.co/json
#  JSON.decode("{\"result\":\"this will be a elixir result\"}")
# {:ok, [result: "this will be a elixir result"]}

IO.puts System.cmd("date")