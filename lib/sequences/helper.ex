defmodule Sequences.Helper do
  
  def up_to_root(collection_of_numbers, max) do
    Stream.take_while collection_of_numbers, fn n -> n*n < max end 
  end

  def divisible_by_any?(num, list) do
    Enum.any? list, fn divider ->
      rem(num, divider) == 0
    end 
  end

end