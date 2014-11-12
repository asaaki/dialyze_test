defmodule DialyzeTest.Mixfile do
  use Mix.Project

  def project do
    [app: :dialyze_test,
     version: "0.0.1",
     elixir: "~> 1.0",
     deps: deps]
  end

  def application do
    [applications: [:logger]]
  end

  defp deps do
    [
      { :poison, "~> 1.2" },
      { :dialyze, "~> 0.1" }
    ]
  end
end
