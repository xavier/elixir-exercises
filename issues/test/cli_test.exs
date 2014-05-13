defmodule CliTest do
  use ExUnit.Case

  import Issues.CLI, only: [parse_args: 1]

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

end
