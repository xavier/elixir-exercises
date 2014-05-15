defmodule Issues.Mixfile do
  use Mix.Project

  def project do
    [app: :issues,
     version: "0.0.1",
     elixir: "~> 0.13.0",
     escript_main_module: Issues.CLI,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [
      mod: { Issues, [] },
      applications: [ :httpotion ]
    ]
  end

  # List all dependencies in the format:
  #
  # { :foobar, git: "https://github.com/elixir-lang/foobar.git", tag: "0.1" }
  #
  # Type `mix help deps` for more examples and options
  defp deps do
    [
      { :httpotion, github: "pragdave/httpotion" },
      { :jsx,       github: "talentdeficit/jsx" }
    ]
  end
end
