defmodule Calculator.Server do
  use GenServer
  alias Calculator.Core

  def start_link(initial) when is_integer(initial) do
    GenServer.start_link(__MODULE__, initial)
  end

  @impl true
  def init(number) do
    {:ok, number}
  end

  @impl true
  def handle_cast({:add, number}, state) do
    {:noreply, Core.add(state, number)}
  end

  @impl true
  def handle_cast({:subtract, number}, state) do
    {:noreply, Core.subtract(state, number)}
  end

  @impl true
  def handle_cast({:multiply, number}, state) do
    {:noreply, Core.multiply(state, number)}
  end

  @impl true
  def handle_cast({:divide, number}, state) do
    {:noreply, Core.divide(state, number)}
  end

  @impl true
  def handle_cast(:negate, state) do
    {:noreply, Core.negate(state)}
  end

  @impl true
  def handle_cast(:clear, _state) do
    {:noreply, 0}
  end

  @impl true
  def handle_call(:state, _from, state) do
    {:reply, state, state}
  end

  @impl true
  def handle_info(:inc, state) do
    {:noreply, Core.inc(state)}
  end
end
