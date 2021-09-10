defmodule RationalNumbers do
  @type rational :: {integer, integer}

  @doc """
  Add two rational numbers
  """
  @spec add(a :: rational, b :: rational) :: rational
  def add({n1,d1}, {n2,d2}) do
    {n1*d2+n2*d1, d1*d2} |> reduce()
  end

  @doc """
  Subtract two rational numbers
  """
  @spec subtract(a :: rational, b :: rational) :: rational
  def subtract({n1,d1}, {n2,d2}) do
    {n1*d2-n2*d1, d1*d2} |> reduce()
  end

  @doc """
  Multiply two rational numbers
  """
  @spec multiply(a :: rational, b :: rational) :: rational
  def multiply({n1,d1}, {n2,d2}) do
    {n1*n2, d1*d2} |> reduce()
  end

  @doc """
  Divide two rational numbers
  """
  @spec divide_by(num :: rational, den :: rational) :: rational
  def divide_by({n1,d1}, {n2,d2}) do
    {n1*d2, d1*n2} |> reduce()
  end

  @doc """
  Absolute value of a rational number
  """
  @spec abs(a :: rational) :: rational
  def abs(a) do
    {n,d}=a|>reduce()
    cond do
      n<0 -> {-n,d}
      true -> {n,d}
    end
  end

  @doc """
  Exponentiation of a rational number by an integer
  """
  @spec pow_rational(a :: rational, n :: integer) :: rational
  def pow_rational({n,d}, exp) do
    {Integer.pow(n,exp), Integer.pow(d,exp)} |> reduce()
  end

  @doc """
  Exponentiation of a real number by a rational number
  """
  @spec pow_real(x :: integer, n :: rational) :: float
  def pow_real(x, {n,d}) do
    Float.pow(x+0.0, n/(d+0.0))
  end

  @doc """
  Reduce a rational number to its lowest terms
  """
  @spec reduce(a :: rational) :: rational
  def reduce({num,den}) do
    g=Integer.gcd(num,den)
    num=num/g
    den=den/g
    cond do
      den<0 -> {-num,-den}
      true -> {num,den}
    end
  end
end
