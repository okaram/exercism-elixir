defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position :: position) :: integer
  def score({x, y}) do
    distance_sq=x*x+y*y
    cond do
      distance_sq<=1 -> 10
      distance_sq<=25 -> 5
      distance_sq<=100 -> 1
      true -> 0
    end
  end
end
