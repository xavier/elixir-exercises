defmodule SpawnTest do

  def process do
    receive do
      {sender, token} ->
        send sender, {:ok, token}
        process
    end
  end

  def test_process_1 do

    process1 = spawn(SpawnTest, :process, [])
    process2 = spawn(SpawnTest, :process, [])

    send process1, {self, "foo"}
    send process2, {self, "bar"}

    receive do
      {:ok, token} ->
        IO.puts token
      after 500 ->
        IO.puts "timeout"
    end

    receive do
      {:ok, token} ->
        IO.puts token
      after 500 ->
        IO.puts "timeout"
    end

  end

  def test_process_2 do
    tokens = ["foo", "bar"]

    Enum.map tokens, fn (token) ->
      pid = spawn(SpawnTest, :process, [])
      send pid, {self, token}
      :ok
    end

    Enum.each tokens, fn (_) ->
      receive do
        {:ok, token} ->
          IO.puts token
        after 500 ->
          IO.puts "timeout"
      end
    end


  end

end



SpawnTest.test_process_1
SpawnTest.test_process_2