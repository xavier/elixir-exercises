defmodule Ciphers do

  def caesar(list, n) do
    Enum.map(list, _caesar_cipher(n))
  end

  @first_letter ?a

  defp _caesar_cipher(n) do
    fn (letter) ->
      @first_letter + rem((letter - @first_letter) + n, 26)
    end
  end

end

IO.puts Ciphers.caesar('ryvkve', 13)