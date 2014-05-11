defmodule Sales do

  def read(filename) do
    File.open!(filename, fn(file) ->
      headers = _process_header_line(file)
      _process_line(file, headers, [])
    end)
  end

  defp _process_header_line(file) do
    line = IO.read(file, :line)
    _line_to_row(line)
  end

  defp _process_line(file, headers, list) do
    line = IO.read(file, :line)
    if line == :eof do
      list
    else
      [_parse_line(line, headers)|_process_line(file, headers, list)]
    end
  end

  defp _parse_line(line, headers) do
    row = _line_to_row(line)
    Enum.zip(headers, row)
    |> Enum.map &_process_field/1
  end

  defp _line_to_row(line) do
    String.strip(line) |> String.split(",")
  end

  defp _process_field({"id", value}),         do: {"id", binary_to_integer(value)}
  defp _process_field({"net_amount", value}), do: {"net_amount", binary_to_float(value)}
  defp _process_field({field, value}),        do: {field, value}

end

IO.inspect Sales.read("data/sales.txt")