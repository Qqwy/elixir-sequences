defmodule SequencesTest do
  use ExUnit.Case, async: true
  use Ratio, override_math: false
  doctest Sequences
  doctest Sequences.Primes
  doctest Sequences.Helper

end
