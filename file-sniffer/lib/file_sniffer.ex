defmodule FileSniffer do
  def type_from_extension("exe") do "application/octet-stream" end
  def type_from_extension("bmp") do "image/bmp" end
  def type_from_extension("png") do "image/png" end
  def type_from_extension("jpg") do "image/jpg" end
  def type_from_extension("gif") do "image/gif" end

  def type_from_binary(<<0x7F, 0x45, 0x4C, 0x46, _rest::binary>>) do
    "application/octet-stream"
  end

  def type_from_binary(<<0x42, 0x4D, _rest::binary>>) do
    "image/bmp"
  end

  def type_from_binary(<<0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A, _rest::binary>>) do
    "image/png"
  end
  def type_from_binary(<<0xFF, 0xD8, 0xFF, _rest::binary>>) do
    "image/jpg"
  end
  def type_from_binary(<<0x47, 0x49, 0x46, _rest::binary>>) do
    "image/gif"
  end

  def verify(file_binary, extension) do
    if type_from_binary(file_binary)==type_from_extension(extension) do
      {:ok, type_from_extension(extension)}
    else
      {:error, "Warning, file format and file extension do not match."}
    end
  end
end
