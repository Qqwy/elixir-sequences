defmodule Sequences do
  @moduledoc """
  The Sequences module defines multiple methods that return a Stream of numbers, usually integers.
  
  The different Streams can be tapped in on-demand, by running any `Enum` function on them.
  *Be warned:* Do not use any function that iterates through the complete Stream. If you try this, *your code will hang*, as Elixir will never finish iterating through the infinite lists.


  For efficiency, these sequences are calculated in a way that re-uses previously calculated results whenever possible.

  See https://github.com/Qqwy/elixir-sequences for more information.

  """


  @doc """
  Defines an infinitely continuing integer Stream, starting at *start* , with step *step* between values.
  *step* defaults to `1`.

  ## Usage:

  Sequences.integers(start, step)

  ## Examples:

      iex> Sequences.integers(0,3) |> Enum.take(5)
      [0,3,6,9,12]

      iex> Sequences.integers(10,-1) |> Enum.take(5)
      [10,9,8,7,6]
  """
  def integers(start, step \\ 1) do
    Stream.iterate(start, &(&1+step))
  end

  @doc """
  An ascending Stream containing the nonnegative integers (A001477)
  
  ## Examples:

      iex> Sequences.integers |> Enum.take(5)
      [0,1,2,3,4]
  """
  def integers do
    integers(0)
  end

  @doc """
  An ascending Stream containing the positive integers (A000027)
  
  ## Examples:

      iex> Sequences.positive_integers |> Enum.take(5)
      [1,2,3,4,5]
  """
  def positive_integers do
    integers(1)
  end

  @doc """
  An ascending Stream containing the odd integers (A005408)
  
  ## Examples:

      iex> Sequences.odd_integers |> Enum.take(5)
      [1,3,5,7,9]
  """
  def odd_integers do
    integers(1, 2)
  end

  @doc """
  An ascending Stream containing the even integers (A005843)
  
  ## Examples:

      iex> Sequences.even_integers |> Enum.take(5)
      [0,2,4,6,8]
  """
  def even_integers do
    integers(0, 2)
  end

  @doc """ 
  An infinite Stream of zeroes (A000004)

  ## Examples:

      iex> Sequences.zeroes |> Enum.take(5)
      [0,0,0,0,0]
  """
  def zeroes do
    integers(0,0)
  end

  @doc """ 
  An infinite Stream of ones (A000012)

  ## Examples:

      iex> Sequences.ones |> Enum.take(5)
      [1,1,1,1,1]
  """
  def ones do
    integers(1,0)
  end

  @doc """ 
  An infinite Stream containing the Factorial numbers (A000142).

  Runs in O(n)

  ## Definition:

  - fact(0) = 1
  - fact(n) = n * fact(n-1)


  ## Examples:

      iex> Sequences.factorials |> Enum.take(5)
      [1, 1, 2, 6, 24]
  """
  def factorials do
    Stream.concat(
      [1], # Factorial of 0
      Stream.scan(Sequences.positive_integers, 1, &(&1*&2)) 
    )
  end

  @doc """ 
  An infinite Stream containing the Fibonacci numbers (A000045).

  Runs in O(n)

  ## Definition:
  
  - fib(0) = 1
  - fib(1) = 1
  - fib(n) = fib(n-1) + fib(n-2)

  ## Examples:

      iex> Sequences.fibonacchi |> Enum.take(5)
      [1, 1, 2, 3, 5]
  """
  def fibonacchi do
    Stream.iterate({1,0}, fn {n, prev} -> {n+prev, n} end)
    |> Stream.map(fn {n, _} -> n end)
  end

  @doc """ 
  An infinite Stream containing the Catalan numbers (A000108).

  Runs in O(n²), memory consumption is O(n²)

  ## Definition:
  
  - C(0) = 1
  - C(1) = 1
  - C(n) = Σ( C(i) * C(n-i)) for all i <- 0 <= i < n

  ## Examples:

      iex> Sequences.catalan |> Enum.take(5)
      [1, 2, 5, 14, 42]
  """
  def catalan do
    Sequences.integers
    |> Stream.scan([1], fn _, catalan_list -> 
        [catalan_sum(catalan_list) | catalan_list]
      end)
    |> Stream.map(&List.first/1)
  end

  # Expects a list of the first `n-1` Catalan numbers.
  # Will calculate the n-th Catalan number.

  # C(n) = Sum for all i in 0 <= i < n
  #  C(i) * C(n-i)
  defp catalan_sum(catalan_list) do
    catalan_list
    |> Enum.zip(Enum.reverse catalan_list) 
    |> Enum.map(fn {a,b}->a*b end)
    |> Enum.sum
  end


  @doc """
  An infinite Stream containing the Triangular numbers (A000217).

  ## Definition

  - L(0) = 0
  - L(1) = 1
  - L(n) = L(n-2)+(2*n)-1

  ## Examples:
 
      iex> Sequences.triangular |> Enum.take(5)
      [0, 1, 3, 6, 10]


  """
  def triangular do
    Stream.concat(
      [0], #Base cases
      Stream.iterate([1, 0, 2], fn [prev, prevprev, n] -> 
        [prevprev + (n*2)-1, prev, n+1]
      end)
      |> Stream.map(&List.first/1)
    )
  end

  @doc """
  Defines an ascending integer Stream, containing the Prime numbers (A000040).

  This function uses `Sequences.Primes.trial_division` internally, although this might change in the future when more, faster prime-discovery methods are added.

  Runs in O(n*sqrt(n)/ln(n)²)

  
  ## Examples:

      iex> Sequences.primes |> Enum.take(10)
      [2,3,5,7,11,13,17,19,23,29]
  """
  def primes do
    Sequences.Primes.trial_division
  end

end

