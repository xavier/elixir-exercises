defmodule CliTest do
  use ExUnit.Case

  import Issues.CLI, only: [
    parse_args: 1,
    sort_into_ascending_order: 1,
    convert_list_to_hashdicts: 1
  ]

  test "parsing of empty command line" do
    assert parse_args([]) == :help
  end

  test "parsing of -h" do
    assert parse_args(["-h", "whatever"]) == :help
  end

  test "parsing of --help" do
    assert parse_args(["-help", "whatever"]) == :help
  end

  test "parsing of 3 parameters" do
    assert parse_args(["user", "project", "13"]) == {"user", "project", 13}
  end

  test "parsing of 2 parameters" do
    assert parse_args(["user", "project"]) == {"user", "project", 4}
  end

  test "sorting of issues in ascending order" do
    result = sort_into_ascending_order(fake_created_at_list(~w{c a b}))
    issues = for issue <- result, do: issue["created_at"]
    assert issues == ~w{a b c}
  end

  defp fake_created_at_list(values) do
    data = for value <- values, do: [{"created_at", value}, {"other_data", "whatever"}]
    convert_list_to_hashdicts(data)
  end

end
