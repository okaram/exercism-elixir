defmodule BasketballWebsite do
  def extract_from_pathl(_data, []) do nil end
  def extract_from_pathl(nil, _lp) do nil end
  # def extract_from_pathl(data, [h]) do
  #   IO.inspect(data)
  #   data[h]
  # end

  def extract_from_pathl(data, [h]) do
    f=Map.fetch(data,h)
    if f==:error do
      nil
    else
      {:ok, val}=f
      val
    end
  end
  def extract_from_pathl(data, [h|t]) do
    f=Map.fetch(data,h)
    if f==:error do
      nil
    else
      {:ok, val}=f
      extract_from_pathl(val,t)
    end
  end
#  def extract_from_pathl(data, [h|t]) do extract_from_pathl(data[h],t) end

  def extract_from_path(data, path) do
    extract_from_pathl(data,String.split(path,"."))
  end

  def get_in_path(data, path) do
    extract_from_pathl(data,String.split(path,"."))
  end
end
