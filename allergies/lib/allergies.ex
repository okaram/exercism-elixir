defmodule Allergies do
  @doc """
  List the allergies for which the corresponding flag bit is true.
  """
  @spec list([non_neg_integer], [String.t()]) :: [String.t()]
  def list([],[]) do [] end
  def list([1|bt],[h|t]) do [h | list(bt,t)] end
  def list([0|bt],[_h|t]) do list(bt,t) end

  @spec list(non_neg_integer) :: [String.t()]
  def list(flags) do
    <<a::1, b::1, c::1, d::1, e::1, f::1, g::1, h::1>> = <<flags::8>>
    list([a,b,c,d,e,f,g,h], ["cats","pollen","chocolate","tomatoes","strawberries","shellfish","peanuts","eggs"])
  end

  @doc """
  Returns whether the corresponding flag bit in 'flags' is set for the item.
  """
  @spec allergic_to?(non_neg_integer, String.t()) :: boolean
  def allergic_to?(flags, item) do
    (list(flags) |> Enum.filter( fn(x)->x==item end))!=[]
  end
end
