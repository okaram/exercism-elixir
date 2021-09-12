defmodule Sublist do

  def is_immediate_sublist([],_) do true end
  def is_immediate_sublist([h|t1],[h|t2]) do is_immediate_sublist(t1,t2) end
  def is_immediate_sublist(_,_) do false end

  def is_sublist([],_) do true end
  def is_sublist([_h|_t],[]) do false end
  def is_sublist([h1|t1],[h1|t2]) do is_immediate_sublist(t1,t2) or is_sublist([h1|t1],t2) end
  def is_sublist(l1,[_|t2]) do  is_sublist(l1,t2) end


  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  Return :equal, :sublist, :superlist or :unequal
  """
  def compare(a, b) do
    cond do
      is_sublist(a,b) and is_sublist(b,a) -> :equal
      is_sublist(a,b)  -> :sublist
      is_sublist(b,a)  -> :superlist
      true -> :unequal
    end
  end
end
