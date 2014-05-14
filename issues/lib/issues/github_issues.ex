defmodule Issues.GitHubIssues do

  alias HTTPotion.Response

  @user_agent ["User-Agent": "Elixir"]

  def fetch(username, project) do
    case HTTPotion.get(issues_url(username, project), @user_agent) do
      Response[body: body, status_code: status, headers: _headers] when status in 200..299 ->
        {:ok, body}
      Response[body: body, status_code: status, headers: _headers] ->
        {:error, body}
    end
  end

  def issues_url(username, project) do
    "https://api.github.com/repos/#{username}/#{project}/issues"
  end

end