defmodule Bob do
  @spec hey(String.t()) :: String.t()
  def hey(input) do
    input=String.replace(input,~r/[ \r\t\n]/,"")
    cond do
      input == "" -> "Fine. Be that way!"
      not(input =~ ~r/[a-z]+/) and input =~ ~r/[A-Z]+/ and input =~ ~r/.*\?$/ -> "Calm down, I know what I'm doing!"
      input =~ ~r/.*\?$/ -> "Sure."
      # exercise probably wants another definition of upper/lowercase
      not(input =~ ~r/[a-z]+/) and input =~ ~r/[A-ZХОДИ]+/
        -> "Whoa, chill out!"

      true -> "Whatever."
    end
  end
end
