defmodule TakeANumber do
  def take_numbers(state \\ 0) do
    receive do
      {:report_state, sender_pid} ->
        send(sender_pid, state)
        take_numbers(state)
      {:take_a_number, sender_pid} ->
        send(sender_pid,state+1)
        take_numbers(state+1)
      :stop ->
        0
      _ ->
        take_numbers(state)
    end
  end
  def start() do
    spawn(&take_numbers/0)
  end
end
