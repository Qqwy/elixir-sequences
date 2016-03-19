defmodule Sequences do

  def integers do
    Stream.iterate(0, &(&1+1))
  end

  def odd_integers do
    Stream.iterate(1, &(&1+2))
  end

  def even_integers do
    Stream.iterate(0, &(&1+2))
  end

  def fibonacchi do
    Stream.iterate({1,0}, fn {n, prev} -> {n+prev, n} end)
    |> Stream.map(fn {n, _} -> n end)
  end



end
