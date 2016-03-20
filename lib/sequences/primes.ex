defmodule Sequences.Primes do

  @doc """
  Defines an ascending integer Stream, containing the Prime numbers (A000040).

  This function uses Trial Division to calculate primes;
  For increased efficiency, only earlier-calculated primes are tested for divisibility.

  Runs in O(n*sqrt(n)/ln(n)²)

  
  ## Examples:

      iex> Sequences.Primes.trial_division |> Enum.take(10)
      [2,3,5,7,11,13,17,19,23,29]
  """
  def trial_division do
    Sequences.odd_integers # Start with the odd numbers.

    # Test each of them by trial-dividing them against already-known prime numbers that are lower than itself.
    # This transforms the list of odd numbers into a list of lists, where each sublist is a list of prime numbers <= to the odd number, in descending order.
    |> Stream.scan([2],fn 
      num, acc when num <= 2 -> 
        acc # Catch the odd number `1`
      num, acc -> 
        # Trial division. If prime, add to the accumulated primes list that is passed on.
        if Sequences.Helper.divisible_by_any?(num, acc) do
          acc
        else
          [num|acc]
        end
    end)
    # Take only the first (highest known) prime from each primes list.
    |> Stream.map(&List.first/1)
    # As each number that did not change the accumulator in the _scan_ step simply copied the primes list from the previous one, we're still left with duplicates. Remove them.
    |> Stream.dedup
  end

end
