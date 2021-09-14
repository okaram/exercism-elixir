defmodule BoutiqueSuggestions do
  def get_combinations(tops, bottoms, options \\ []) do
    maxp= if options[:maximum_price] != nil do options[:maximum_price] else 100 end
    for top <- tops, bottom <- bottoms, top[:base_color]!=bottom[:base_color] and top[:price]+bottom[:price]<=maxp do
        {top,bottom}
    end
  end
end
