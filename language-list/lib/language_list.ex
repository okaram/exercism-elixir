defmodule LanguageList do
  def new() do
    []
  end

  def add(list, language) do
    [language | list]
  end

  def remove([_|t]) do
    t
  end

  def first([h|_]) do
    h
  end

  def count([]) do 0 end
  def count([_|t]) do 1+count(t) end

  def exciting_list?([]) do false end
  def exciting_list?(["Elixir"|_]) do true end
  def exciting_list?([_|t]) do exciting_list?(t) end
end
