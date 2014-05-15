defmodule Issues.TableFormatter do

  def format(rows, headers) do
    columns       = split_into_columns(rows, headers)
    column_widths = calculate_column_widths(columns)
    format_string = build_row_format_string(column_widths)

    IO.puts format_row(headers, format_string)
    IO.puts format_separator(column_widths)
    IO.puts format_rows(columns, format_string)
  end

  defp split_into_columns(rows, headers) do
    for header <- headers do
      for row <- rows, do: to_string(row[header])
    end
  end

  defp calculate_column_widths(columns) do
    for column <- columns do
      column
      |> Enum.map(&String.length/1)
      |> Enum.max
    end
  end

  defp build_row_format_string(column_widths) do
    Enum.map_join(column_widths, " | ", &build_column_format_string/1)
  end

  defp build_column_format_string(width) do
    "~-#{width}s"
  end

  defp format_separator(column_widths) do
    Enum.map_join(column_widths, "-+-", &(List.duplicate("-", &1)))
  end

  defp format_row(row, format_string) do
    :io_lib.format(format_string, row)
  end

  defp format_rows(columns, format_string) do
    columns
    |> List.zip
    |> Enum.map(&tuple_to_list/1)
    |> Enum.map_join("\n", &(format_row(&1, format_string)))
  end

end