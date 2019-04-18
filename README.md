
# Sequences

[![hex.pm version](https://img.shields.io/hexpm/v/sequences.svg)](https://hex.pm/packages/sequences)
[![Build Status](https://travis-ci.org/Qqwy/elixir-sequences.svg?branch=master)](https://travis-ci.org/Qqwy/elixir-sequences)

This Elixir Module defines many useful integer sequences.

These sequences are created as Streams, which means that they are lazily evaluated.

Most of these sequences use a recurrence relation that calculates the *n*-th element from *n-1* or other earlier known data. This means that if you only want the *n*-th item of a Sequence, there might be another algorithm that is faster; But if you want multiple consecutive elements of a Sequence, this module is right up your alley!



Repository: [https://github.com/Qqwy/elixir-sequences](https://github.com/Qqwy/elixir-sequences)


## List of included sequences:

- `Sequences.integers(start, step)`: a helper function to create any kind of lazy integer sequence with a regular step distance.
- `Sequences.integers`
- `Sequences.positive_integers` 
- `Sequences.odd_integers`
- `Sequences.even_integers` 
- `Sequences.zeroes`
- `Sequences.ones`
- `Sequences.factorials`
- `Sequences.fibonacci`
- `Sequences.catalan`
- `Sequences.triangular`
- `Sequences.primes`
- `Sequences.squareroot_tuple(n)`: Returns a tuple with an integer part (single integer number) and decimal part (digit stream)
- `Sequences.squareroot_tuple(n, num_of_digits)`: Returns a tuple with an integer part (single integer number) and decimal part (digit list with given length)
- `Sequences.squareroot_decimals(n)`: Returns decimal stream of the decimal expansion of a square root.
- `Sequences.squareroot_expansion/1`: Returns a digit stream of the decimal expansion of a square root, including the digits of the integral part at the front.

## A note on Prime numbers

There are multiple known ways to generate prime numbers. Because each of these variants might have a different *(time, memory)-efficiency* on different intervals, prime generation variants can be called directly:

- Sequences.Primes.trial_division

(For now, there is only this one)

`Sequences.primes` uses `Sequences.Primes.trial_division` internally. This might change in the future.


## Installation

This package is [available in Hex](https://hex.pm/packages/sequences)

  1. Add sequences to your list of dependencies in `mix.exs`:

        def deps do
          [{:sequences, "~> 1.1.0"}]
        end

  2. Ensure sequences is started before your application:

        def application do
          [applications: [:sequences]]
        end

## Changelog

- 1.1.1: Update dependency versions to newer ones. Drops support for Elixir < 1.3
- 1.1.0: Sequences for square root expansions.
- 1.0.0: First fully-functional version.
