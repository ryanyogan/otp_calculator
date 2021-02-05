defmodule Calculator.Core do
  @moduledoc """
  Basic implentation of a `Calculator.Core` which acts as the
  functional layer to work with data.

  NOTICE: This little application is purely to educate those on OTP.
  Many best practices have been ommmitted on this branch, aslo I think
  your phone most likely has a calculator :)
  """

  def add(acc, number), do: acc + number
  def subtract(acc, number), do: acc - number
  def multiply(acc, number), do: acc * number
  def divide(acc, number), do: acc / number
  def inc(acc), do: add(acc, 1)
  def dec(acc), do: subtract(acc, 1)

  def fold(list, acc, func) do
    Enum.reduce(list, acc, fn item, acc -> func.(acc, item) end)
  end
end
