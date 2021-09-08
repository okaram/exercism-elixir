defmodule HighScore do
  def new() do
    %{}
  end

  def add_player(scores, name) do
    Map.put(scores,name,0)
  end

  def add_player(scores, name, score) do
    Map.put(scores,name,score)
  end

  def remove_player(scores, name) do
    Map.delete(scores,name)
  end

  def reset_score(scores, name) do
    scores |> remove_player(name) |> add_player(name)
  end

  def update_score(scores, name, score) do
    scores |> Map.update(name, score,fn(x) -> score+x end)
  end

  def get_players(scores) do
    Map.keys(scores)
  end
end
