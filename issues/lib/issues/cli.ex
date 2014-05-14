defmodule Issues.CLI do

  @default_count 4

  @moduledoc """
  Handle the command line parsing and dispatch to the various functions
  to end up generating a table of the last _n_ issues in a GitHub project
  """

  def run(argv) do
    argv
    |> parse_args
    |> process
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

  def process(:help) do
    IO.puts """
    Usage: issues <user> <project> [count | #{@default_count}]
    """
    System.halt(0)
  end

  def process({username, project, count}) do
    Issues.GitHubIssues.fetch(username, project)
    |> decode_response
    |> convert_list_to_hashdicts
    |> sort_into_ascending_order
    |> Enum.take(count)
  end

  def decode_response({:ok, body}) do
    :jsx.decode(body)
  end

  def decode_response({:error, body}) do
    error = :jsx.decode(body)["message"]
    IO.puts "Error fetching from GitHub: #{error}"
    System.halt(2)
  end

  def convert_list_to_hashdicts(list) do
    list |> Enum.map(&Enum.into(&1, HashDict.new))
  end

  def sort_into_ascending_order(issues_list) do
    Enum.sort issues_list, fn i1, i2 -> i1["created_at"] < i2["created_at"] end
  end

end