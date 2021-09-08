defmodule KitchenCalculator do
  def get_volume({_label, volume}) do
    volume
  end

  def to_milliliter({:cup, vol}) do {:milliliter,240*vol} end
  def to_milliliter({:milliliter, vol}) do {:milliliter,vol} end
  def to_milliliter({:fluid_ounce, vol}) do {:milliliter,30*vol} end
  def to_milliliter({:teaspoon, vol}) do {:milliliter,5*vol} end
  def to_milliliter({:tablespoon, vol}) do {:milliliter,15*vol} end

#  def from_milliliter({:milliliter, vol}, :cup) do {:cup, vol/240.0} end
#  def from_milliliter({:milliliter, vol}, :milliliter) do {:milliliter, vol} end
#  def from_milliliter({:milliliter, vol}, :fluid_ounce) do {:fluid_ounce, vol/30.0} end
#  def from_milliliter({:milliliter, vol}, :teaspoon) do {:teaspoon, vol/5.0} end
#  def from_milliliter({:milliliter, vol}, :tablespoon) do {:tablespoon, vol/15.0} end
  def from_milliliter({:milliliter, vol}, unit) do
    {:milliliter,rate}=to_milliliter({unit,1})
    {unit, vol/rate }
  end

  def convert(volume_pair, unit) do
    to_milliliter(volume_pair) |> from_milliliter( unit)
  end
end
