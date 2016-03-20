defmodule Sequences.Helper do
  @moduledoc """
  This module contains a few helper methods for the creation and manipulation of certain Sequences.  
  
  """

  @doc """
  Takes elements from the given `collection_of_numbers` while the items in the collection are smaller than the square root of the given `max`.

  It expects the collection_of_numbers to be in ascending format.

  ## Examples: 

    iex> Sequences.integers(0,2) |> Sequences.Helper.up_to_root(100) |> Enum.take(20)
    [0,2,4,6,8]
  """
  def up_to_root(collection_of_numbers, max) do
    Stream.take_while collection_of_numbers, fn n -> n*n < max end 
  end

  @doc """
  Returns `true` if *num* is divisible by any element in *list* (otherwise `false`).
  Stops evaluating the list as soon as a match is found.
  """
  def divisible_by_any?(num, list) do
    Enum.any? list, fn divider ->
      rem(num, divider) == 0
    end 
  end
end