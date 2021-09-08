defmodule GuessingGame do

  def compare(_secret_number) do "Make a guess" end

  def compare(_secret_number, :no_guess) do "Make a guess" end
  def compare(secret_number, guess) do
    dist=secret_number-guess
    cond do
      dist==0 -> "Correct"
      abs(dist)==1 -> "So close"
      guess>secret_number -> "Too high"
      guess<secret_number -> "Too low"
    end
  end
end
