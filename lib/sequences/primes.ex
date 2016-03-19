defmodule Sequences.Primes do


  def trial_division do
    odd_integers = Sequences.odd_integers

    prime_lists = Stream.scan(odd_integers, [2],fn 
      num, acc when num < 2 -> acc
      num, acc -> 
        if Sequences.Helper.divisible_by_any?(num, acc) do
          acc
        else
          [num|acc]
        end
    end)
    primes_with_duplicates = Stream.map prime_lists, &List.first/1
    Stream.dedup primes_with_duplicates
  
  end
  # This is broken, it hangs
  def broken_trial_division do
    integers = Sequences.integers
    possible_primes = Stream.map(integers, fn 
      n when n < 2 -> false 
      2 -> 2
      n ->
        earlier_primes = Sequences.Helper.up_to_root(trial_division, n)
        IO.inspect Enum.to_list earlier_primes
        if earlier_primes |> Enum.any?(fn prime -> rem(n,prime) == 0 end) do
          IO.puts "#{n} is no prime"
          false
        else
          IO.puts "#{n} is prime"
          n
        end
    end)
    primes = Stream.filter possible_primes, &(&1)
  end

  defp get_primes(list) do
    
  end
end