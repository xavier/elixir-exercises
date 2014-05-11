defmodule StringsAndBinaries do

  @ascii_char_range ?\s..?~

  def is_ascii?(charlist) do
    Enum.all? charlist, fn(char) -> Enum.member?(@ascii_char_range, char) end
  end

  def anagram?(word1, word2) do
    Enum.sort(String.codepoints(word1)) == Enum.sort(String.codepoints(word2))
  end

  @operations %{
    ?+ => &(&1 + &2),
    ?- => &(&1 - &2),
    ?/ => &(&1 / &2),
    ?* => &(&1 * &2)
  }

  def calculate(charlist) do
    {operand1, rest} = _read_number(charlist)
    [operator|rest]  = _skip_spaces(rest)
    {operand2, rest} = _read_number(_skip_spaces(rest))
    @operations[operator].(operand1, operand2)
  end

  defp _read_number(charlist) do
    _build_number(charlist, 0)
  end

  @digits    ?0..?9

  defp _build_number([head|tail], n) when head in @digits do
    digit = head - ?0
    _build_number(tail, n*10 + digit)
  end

  defp _build_number(charlist, n) do
    {n, charlist}
  end

  defp _skip_spaces([?\s|tail]) do
    _skip_spaces(tail)
  end

  defp _skip_spaces(charlist) do
    charlist
  end

end

IO.puts StringsAndBinaries.is_ascii?('abc 123~XYZ')
IO.puts StringsAndBinaries.is_ascii?('abc 123XYZ')

IO.puts StringsAndBinaries.anagram?("abc", "cab")
IO.puts StringsAndBinaries.anagram?("xyz", "cab")
IO.puts StringsAndBinaries.anagram?("vélo", "volé")


# iex(5)> ['cat' | 'dog']
# ['cat', 100, 111, 103]
# Reason: same case of pattern matching as  [[1, 2, 3] | [4, 5, 6]] => [[1, 2, 3], 4, 5, 6]

IO.inspect StringsAndBinaries.calculate('123 + 27')
IO.inspect StringsAndBinaries.calculate('17 * 2')
IO.inspect StringsAndBinaries.calculate('36   / 18')
IO.inspect StringsAndBinaries.calculate('123 -  27')
