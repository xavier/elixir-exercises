defmodule Issues.CLI do

  @default_count 4

  @moduledoc """
  Handle the command line parsing and dispatch to the various functions
  to end up generating a table of the last _n_ issues in a GitHub project
  """

  def run(argv) do
    parse_args(argv)
  end

  @doc """
  Supported switches are -h and --help which return :help.
  Otherwise it accept a GitHub username project and an optional number of issues
  """

  def parse_args(argv) do
    parse = OptionParser.parse(argv, switches: [help: :boolean], aliases: [h: :help])
    case parse do
      {[help: true], _, _}           -> :help
      {_, [user, project, count], _} -> {user, project, binary_to_integer(count)}
      {_, [user, project], _}        -> {user, project, @default_count}
      _ -> :help
    end
  end

end