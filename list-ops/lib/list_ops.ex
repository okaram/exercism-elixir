defmodule ListOps do
  # Please don't use any external modules (especially List or Enum) in your
  # implementation. The point of this exercise is to create these basic
  # functions yourself. You may use basic Kernel functions (like `Kernel.+/2`
  # for adding numbers), but please do not use Kernel functions for Lists like
  # `++`, `--`, `hd`, `tl`, `in`, and `length`.

  @spec length(list) :: non_neg_integer
  def length([]) do 0 end
  def length([_h|t]) do 1+ListOps.length(t) end

  @spec reverse(list, list) :: list
  def reverse([], accum) do accum end
  def reverse([h|t], accum) do reverse(t,[h|accum]) end

  @spec reverse(list) :: list
  def reverse(l) do reverse(l,[]) end

  @spec map(list, (any -> any)) :: list
  def map([], _f) do [] end
  def map([h|t], f) do [f.(h) | map(t,f) ] end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter([], _f) do [] end
  def filter([h|t], f) do
    if f.(h) do [h | filter(t,f)] else filter(t,f) end
  end

  @type acc :: any
  @spec foldl(list, acc, (any, acc -> acc)) :: acc
  def foldl([], acc, _f) do
    acc
  end
  def foldl([h|t], acc, f) do
    foldl(t, f.(h,acc) , f)
  end

  @spec foldr(list, acc, (any, acc -> acc)) :: acc
  def foldr([], acc, _f) do acc end
  def foldr([h|t], acc, f) do
    f.(h,foldr(t, acc , f))
  end

  @spec append(list, list) :: list
  def append([], b) do b end
  def append([h|t],b ) do [h | append(t,b)] end

  @spec concat([[any]]) :: [any]
  def concat([]) do [] end
  def concat([h|t]) do append(h ,concat(t)) end
end
