defmodule VariableLengthQuantity do
  @doc """
  Encode integers into a bitstring of VLQ encoded bytes
  """
  def encode_one(i) do
    <<b5::4, b4::7, b3::7, b2::7, b1::7>> = <<i::32>>
    cond do
      b5 !=0 -> <<(b5+128)::8, (b4+128)::8, (b3+128)::8, (b2+128)::8,b1::8>>
      b4 !=0 -> <<(b4+128)::8, (b3+128)::8, (b2+128)::8,b1::8>>
      b3 !=0 -> <<(b3+128)::8, (b2+128)::8, b1::8>>
      b2 !=0 -> <<(b2+128)::8, b1::8>>
      true  -> <<b1>>
    end
  end

  @spec encode(integers :: [integer]) :: binary
  def encode([h]) do encode_one(h) end
  def encode([h|t]) do <<encode_one(h)::binary, encode(t)::binary>> end

  def decode(<<val::8>>, _accum) when val>=128 do raise "bad juju" end
  def decode(<<val::8>>, accum) do [128*accum+val] end
  def decode(<<val::8, rest::binary>>,accum) when val>=128 do decode(rest,128*accum+(val-128)) end
  def decode(<<val::8, rest::binary>>,accum) do [(128*accum+val) | decode(rest,0)] end
  @doc """
  Decode a bitstring of VLQ encoded bytes into a series of integers
  """
  @spec decode(bytes :: binary) :: {:ok, [integer]} | {:error, String.t()}
  def decode(bin) do
    try do
      {:ok, decode(bin,0)}
    rescue
      _ -> {:error, "incomplete sequence"}
    end
  end
end
