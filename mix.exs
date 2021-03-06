defmodule Sequences.Mixfile do
  use Mix.Project

  def project do
    [app: :sequences,
     version: "1.2.1",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: description(),
     package: package(),
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:earmark, ">= 0.0.0", only: [:dev]}, # Markdown, dependency of ex_doc
      {:ex_doc, "~> 0.11", only: [:dev]},    # Documentation for Hex.pm
      # Used for the integer square root calculation.
      # TODO: Re-point to master math library as soon as functionality is merged in master branch.
      {:ratio, ">= 1.0.0"},
      {:math, ">= 0.1.0"} 
    ]
  end



  defp description do
    """
    The Sequences module defines multiple methods that return a Stream of numbers, usually integers.
    """
  end

  defp package do
    [
     files: ["lib", "mix.exs", "README*", "LICENSE*"],
     maintainers: ["Qqwy"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/Qqwy/elixir-sequences"}]
  end
end
