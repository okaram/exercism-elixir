defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    #<= required for stable sort
#    inventory |> Enum.sort(fn(a,b)-> a.price<=b.price end)
    inventory |> Enum.sort(&(&1.price<=&2.price))
  end

  def with_missing_price(inventory) do
    inventory |> Enum.filter(fn(a)->a.price==nil end)
  end

  def increase_quantity(item, count) do
    newq=item[:quantity_by_size] |> Enum.map(fn({k,v}) -> {k,v+count} end)
    item |> Map.put(:quantity_by_size, Map.new(newq))
  end

  def total_quantity(item) do
    item[:quantity_by_size]
      |> Enum.map(fn({_k,v}) -> v end )
      |> Enum.reduce(0,fn(a,b)->a+b end)
  end
end

