defmodule Username do
  def replace(?ä) do "ae" end
  def replace(?ö) do "oe" end
  def replace(?ü) do "ue" end
  def replace(?ß) do "ss" end
  def replace(x) do <<x>> end

  def is_lowercase(l) do l>="a" and l<="z" end
  def is_acceptable(l) do l=="_" or is_lowercase(l) or l in ["ae","oe","ue","ss"] end

  def is_acceptable2(l) do l==?_ or (l>=?a and l<=?z) or l in 'äöüß' end
  # we"re getting charlists, not strings
  def sanitize2(username) do
    username
    |> Enum.filter(&Username.is_acceptable2/1)
    |> Enum.map(&Username.replace/1)
    |> Enum.join("")
    |> to_charlist()
  end

  def sanitize([]) do [] end
  def sanitize([?ä|t]) do 'ae'++sanitize(t) end
  def sanitize([?ö|t]) do 'oe'++sanitize(t) end
  def sanitize([?ü|t]) do 'ue'++sanitize(t) end
  def sanitize([?ß|t]) do 'ss'++sanitize(t) end
  def sanitize([?_|t]) do [?_ | sanitize(t)] end
  def sanitize([h|t]) when h>=?a and h<=?z do [h | sanitize(t)] end
  def sanitize([_h|t]) do sanitize(t) end

end
