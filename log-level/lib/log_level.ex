defmodule LogLevel do
  def to_label(level, legacy?) do
    if legacy? do
      case level do
        0 -> :unknown
        1 -> :debug
        2	-> :info
        3	-> :warning
        4 -> :error
        5 -> :unknown
        level -> :unknown
      end
    else
      case level do
        0 -> :trace
        1 -> :debug
        2	-> :info
        3	-> :warning
        4 -> :error
        5 -> :fatal
        level -> :unknown
      end
    end
  end

  def alert_recipient(level, legacy?) do
    label=to_label(level,legacy?)
    cond do
      label==:error or label==:fatal -> :ops
      label==:unknown and legacy? -> :dev1
      label==:unknown -> :dev2
      true -> nil
    end
  end
end
