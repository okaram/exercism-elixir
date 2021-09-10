defmodule ResistorColorDuo do
  def code(:black) do 0 end
  def code(:brown) do  1 end
  def code(:red) do 2 end
  def code(:orange) do 3 end
  def code(:yellow) do 4 end
  def code(:green) do 5 end
  def code(:blue) do 6 end
  def code(:violet) do 7 end
  def code(:grey) do 8 end
  def code(:white) do 9 end

  @doc """
  Calculate a resistance value from two colors
  """
  @spec value(colors :: [atom]) :: integer
  def value([c1, c2 | _]) do 10*code(c1)+code(c2) end
end
