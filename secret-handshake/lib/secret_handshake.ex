defmodule SecretHandshake do
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  def commands5(<<0::1, rest::bitstring>>) do Enum.reverse(commands4(rest)) end
  def commands5(<<1::1, rest::bitstring>>) do commands4(rest) end

  def commands4(<<1::1, rest::bitstring>>) do  ["jump" | commands3(rest) ]
  end
  def commands4(<<0::1, rest::bitstring>>) do commands3(rest) end

  def commands3(<<1::1, rest::bitstring>>) do  ["close your eyes" | commands2(rest) ]
  end
  def commands3(<<0::1, rest::bitstring>>) do commands2(rest) end

  def commands2(<<1::1, rest::bitstring>>) do  ["double blink" | commands1(rest) ]
  end
  def commands2(<<0::1, rest::bitstring>>) do commands1(rest) end
  def commands1(<<0::1>>) do [] end
  def commands1(<<1::1>>) do ["wink"] end

  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do commands5(<<code::5>>) end
end
