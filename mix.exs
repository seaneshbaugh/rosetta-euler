defmodule RosettaEuler.Mixfile do
  use Mix.Project

  def project do
    [app: :rosetta_euler,
     version: "0.0.1",
     elixir: "~> 1.0",
     package: package,
     description: """
     Project for running Rosetta Euler tests.
     """,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  def application do
    [applications: []]
  end

  defp package do
    [contributors: ["Sean Eshbaugh"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/seaneshbaugh/rosetta-euler"}]
  end

  defp deps do
    []
  end
end
