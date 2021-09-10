require Integer

defmodule CollatzConjecture do
  @doc """
  calc/1 takes an integer and returns the number of steps required to get the
  number to 1 when following the rules:
    - if number is odd, multiply with 3 and add 1
    - if number is even, divide by 2
  """
  @spec calc(input :: pos_integer(), current :: non_neg_integer()) :: non_neg_integer()
  def calc(input, current) do
    cond do
      input==1 -> current
      Integer.is_even(input) -> calc(Integer.floor_div(input,2),current+1)
      true -> calc(input*3+1,current+1)
    end
  end


  @spec calc(input :: pos_integer()) :: non_neg_integer()
  def calc(input) when is_integer(input) and input>0 do
    calc(input,0)
  end
end
