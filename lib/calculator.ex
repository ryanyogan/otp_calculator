defmodule Calculator do
  alias Calculator.Server

  def start(initial_state) do
    Server.start_link(initial_state)
  end

  def add(calculator, n), do: GenServer.cast(calculator, {:add, n})
  def subtract(calculator, n), do: GenServer.cast(calculator, {:subtract, n})
  def multiply(calculator, n), do: GenServer.cast(calculator, {:multiply, n})
  def divide(calculator, n), do: GenServer.cast(calculator, {:divide, n})
  def negate(calculator), do: GenServer.cast(calculator, :negate)
  def clear(calculator), do: GenServer.cast(calculator, :clear)

  def inc(calculator), do: send(calculator, :inc)

  def state(pid) do
    GenServer.call(pid, :state)
  end
end
