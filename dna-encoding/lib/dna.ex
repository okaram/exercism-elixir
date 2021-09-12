defmodule DNA do
  def encode_nucleotide(?\s) do 0b0000 end
  def encode_nucleotide(?A) do 0b0001 end
  def encode_nucleotide(?C) do 0b0010 end
  def encode_nucleotide(?G) do 0b0100 end
  def encode_nucleotide(?T) do 0b1000 end

  def decode_nucleotide(0b0000) do ?\s end
  def decode_nucleotide(0b0001) do ?A end
  def decode_nucleotide(0b0010) do ?C end
  def decode_nucleotide(0b0100) do ?G end
  def decode_nucleotide(0b1000) do ?T end
  def encode([h]) do <<encode_nucleotide(h)::4>> end
  def encode([h|t]) do <<encode_nucleotide(h)::4, encode(t)::bitstring>> end

  def decode(<<value::4>>) do [decode_nucleotide(value)] end
  def decode(<<value::4, rest::bitstring>>) do [decode_nucleotide(value) | decode(rest)] end
end
