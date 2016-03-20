
# Sequences


This Elixir Module defines many useful integer sequences.

These sequences are created as Streams, which means that they are lazily evaluated.

Most of these sequences use a recurrence relation that calculates the *n*-th element from *n-1* or other earlier known data. This means that if you only want the *n*-th item of a Sequence, there might be another algorithm that is faster; But if you want multiple consecutive elements of a Sequence, this module is right up your alley!



Repository: [https://github.com/Qqwy/elixir-sequences](https://github.com/Qqwy/elixir-sequences)


## List of included sequences:

- Sequences.integers(start, step): a helper function to create any kind of lazy integer sequence with a regular step distance.
- Sequences.integers
- Sequences.positive_integers 
- Sequences.odd_integers
- Sequences.even_integers
- Sequences.zeroes
- Sequences.ones
- Sequences.factorials
- Sequences.fibonacci
- Sequences.catalan
- Sequences.triangular
- Sequences.primes

## A note on Prime numbers

There are multiple known ways to generate prime numbers. Because each of these variants might have a different *(time, memory)-efficiency* on different intervals, prime generation variants can be called directly:

- Sequences.Primes.trial_division

(For now, there is only this one)

`Sequences.primes` uses `Sequences.Primes.trial_division` internally. This might change in the future.


## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add sequences to your list of dependencies in `mix.exs`:

        def deps do
          [{:sequences, "~> 0.0.1"}]
        end

  2. Ensure sequences is started before your application:

        def application do
          [applications: [:sequences]]
        end

