defmodule Sequences.Taylor do

  alias Numbers, as: N

  @defaultTerms 10

  def series(seriesFun, terms) do
    Sequences.integers()
    |> Stream.map(seriesFun)
    |> Enum.take(terms)
    |> Enum.reduce(&(N.add(&1, &2)))
  end

  @doc "Exponentiation."
  def exp(x, terms \\ @defaultTerms) do
    series(fn n ->
      N.div(N.pow(x, n), Math.factorial(n))
    end, terms)
  end

  @doc "Natural Logarithm"
  def log(x, terms \\ @defaultTerms) do
    series(fn n ->
      N.div(N.pow(x, n), Math.factorial(n))
    end, terms)
  end

  @doc "Sine. TODO: Better approximation?"
  def sin(x, terms \\ @defaultTerms) do
    series(fn n ->
      # n1 = N.add(N.mult(n, 2), 1)
      # n2 = N.add(n1, 2)
      # positiveTerm = N.div(N.pow(x, n1), Math.factorial(n1))
      # negativeTerm = N.div(N.pow(x, n2), Math.factorial(n2))
      # N.sub(positiveTerm, negativeTerm)
      N.mult(N.div(N.pow(Decimal.new(-1), n), Math.factorial(2 * n + 1)), N.pow(x, 2 * n + 1))
    end, terms)
  end

end
