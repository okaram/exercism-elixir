defmodule RPG do
  defprotocol Edible do
    def eat(item,character)
  end

  defmodule Character do
    defstruct health: 100, mana: 0
  end

  defmodule LoafOfBread do
    defstruct []
  end


  defmodule ManaPotion do
    defstruct strength: 10
  end

  defmodule Poison do
    defstruct []
  end

  defmodule EmptyBottle do
    defstruct []
  end

  defimpl Edible, for: ManaPotion do
    def eat(i,c) do
      {%RPG.EmptyBottle{}, %{c| mana: c.mana+i.strength}}
    end
  end

  defimpl Edible, for: LoafOfBread do
    def eat(_i,c) do
      {nil, %{c| health: c.health+5}}
    end
  end

  defimpl Edible, for: Poison do
    def eat(_i,c) do
      {%RPG.EmptyBottle{}, %{c| health: 0}}
    end
  end

end
